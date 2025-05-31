<?php

declare(strict_types= 1);

namespace App\Middleware;

use App\Services\JwtService;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler; 
use Slim\Exception\HttpUnauthorizedException;

class ValidateToken{
  public function __construct(private JwtService $jwtService){}

  public function __invoke(Request $request, RequestHandler $handler): Response
{
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
          throw new HttpUnauthorizedException($request, 'Invalid token signature');
      }

      $request = $request->withAttribute('token', $decoded);
        
    } catch (\Exception $e) {
      throw new HttpUnauthorizedException($request, 'Token validation failed: ' . $e->getMessage());
    }

    return $handler->handle($request);
  }
}