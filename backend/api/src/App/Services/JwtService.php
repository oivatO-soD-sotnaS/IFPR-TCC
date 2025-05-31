<?php
declare(strict_types=1);

namespace App\Services;

use App\Dao\JwtBlacklistDao;
use DateTimeImmutable;
use Exception;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtService {
  private static $secretKey = 'guerraEPaz;LiberdadeEEscravidao;IgnoranciaEForca';
  private static $algorithm = 'HS256';

  private int $expirationTime = 600; // 15 minutos

  public function __construct(private JwtBlacklistDao $dao) {}

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
      if ($this->isBlackListed($token)) {
        return null;
      }
      
      $decoded = JWT::decode($token, new Key(self::$secretKey, self::$algorithm));
      return (array) $decoded;
    } catch (Exception $e) {
      return null;
    }
  }


  public function isBlackListed(string $token): bool
  {
      try {
        return $this->dao->isTokenBlacklisted($token);
      } catch (Exception $e) {
        error_log('Blacklist check failed: ' . $e->getMessage());
        return false;
      }
  }

  /**
   * Adds a valid JWT to the blacklist
   */
  public function blacklistJwt(string $token): bool
  {
    try {
      // First validate the token to get expiration time
      $decoded = $this->validateToken($token);
      
      if (!$decoded) {
        return false; // Invalid token cannot be blacklisted
      }

      $expiresAt = (new DateTimeImmutable())->setTimestamp($decoded['exp']);
      $this->dao->addToken($token, $expiresAt);
      
      return true;
    } catch (Exception $e) {
      error_log('Token blacklisting failed: ' . $e->getMessage());
      return false;
    }
  }
}