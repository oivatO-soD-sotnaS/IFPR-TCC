<?php

declare(strict_types= 1);

namespace App\Controllers;

use Slim\Exception\HttpBadRequestException;
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
}