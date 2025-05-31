<?php
declare(strict_types=1);

namespace App\Services;

use Exception;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtService {
  private static $secretKey = 'guerraEPaz;LiberdadeEEscravidao;IgnoranciaEForca';
  private static $algorithm = 'HS256';

  private int $expirationTime = 900; // 15 minutos

  public function generateToken(string $userId, string $email): string {
    $issuedAt = time();
    $expirationTime = $issuedAt + $this->expirationTime; // 1 hora de validade
    
    $payload = [
        'iat' => $issuedAt,
        'exp' => $expirationTime,
        'sub' => $userId,
        'email' => $email,
    ];
    
    return JWT::encode($payload, self::$secretKey, self::$algorithm);
  }

  public function validateToken($token): ?array {
    try {
      $decoded = JWT::decode($token, new Key(self::$secretKey, self::$algorithm));
      return (array) $decoded;
    } catch (Exception $e) {
      return null;
    }
  }
}