<?php

declare(strict_types= 1);

namespace App\Controllers;

use Slim\Exception\HttpBadRequestException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Exception\HttpUnauthorizedException;
use Slim\Psr7\Response;
use Slim\Psr7\Request;
use App\Dao\UserDao;
use App\Services\JwtService;
use Slim\Exception\HttpNotFoundException;

class AuthController {

  public function __construct(
    private UserDao $dao,
    private JwtService $jwtService
  ){}

  public function login(Request $request, Response $response): Response {
    $body = $request->getParsedBody();
    
    if (!isset($body['email']) || !isset($body['password'])) {
      throw new HttpBadRequestException($request, 'Email and password are required');
    }
    
    $email = $body['email'];
    $password = $body['password'];

    if (! $email) {
      throw new HttpBadRequestException($request, message: 'E-mail is required');
    }
    if (! $password) {
      throw new HttpBadRequestException($request, message: 'Password is required');
    }

    $user = $this->dao->getByEmail($email);
    
    if (! $user) {
      throw new HttpNotFoundException($request, message:'User not found');
    }else if (! $user->isEmailVerified()) {
      throw new HttpNotFoundException($request, message:'User not found');
    }

    if ($user->getPasswordHash() !== $password){
      throw new HttpUnauthorizedException($request, message:'Password doesnt match');
    }

    $jwt = $this->jwtService->generateToken(
      userId: $user->getUserId(),
      email: $user->getEmail(),
    );

    $response->getBody()->write(json_encode([
        'status' => 'success',
        'token' => $jwt
    ]));
    
    return $response;
  }

  public function logout(Request $request, Response $response): Response {
    $authHeader = $request->getHeaderLine("Authorization");
    
    if (empty($authHeader)) {
      throw new HttpUnauthorizedException($request, 'Authorization header is required');
    }

    if (!preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
      throw new HttpUnauthorizedException($request, 'Malformed authorization header');
    }
    
    $token = $matches[1];
    
    if (empty($token) || count(explode('.', $token)) !== 3) {
      throw new HttpUnauthorizedException($request, 'Invalid token format');
    }

    try {
      $decoded = $this->jwtService->validateToken($token);
      
      if (!$decoded) {
        throw new HttpUnauthorizedException($request, 'Invalid token');
      }
      
      if (! $this->jwtService->blacklistJwt($token)){
        throw new HttpInternalServerErrorException($request, 'There was an error when trying to blacklist yout token.');
      }
      
      $response->getBody()->write(json_encode([
        'status' => 'success',
        'message' => 'Token blacklisted with success'
      ]));

      return $response;
    } catch (\Exception $e) {
      throw new HttpUnauthorizedException($request, 'Token validation failed: ' . $e->getMessage());
    }
  }
}