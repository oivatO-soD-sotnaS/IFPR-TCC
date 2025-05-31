<?php

declare(strict_types= 1);

namespace App\Dao;

use App\Database;

class JwtBlacklistDao {
  public function __construct(private Database $database) {}

  public function addToken(string $token, \DateTimeInterface $expiresAt): void
  {
    $pdo = $this->database->getConnection();
    
    // Hash the token before storage
    $tokenHash = hash('sha256', $token);
    
    // Check for existing entry first
    $existing = $pdo->prepare("
      SELECT COUNT(*) FROM jwt_blacklists 
      WHERE token_hash = :token_hash
    ");
    $existing->execute([':token_hash' => $tokenHash]);
    
    if ($existing->fetchColumn() > 0) {
        return; // Already blacklisted
    }

    $stmt = $pdo->prepare("
      INSERT INTO jwt_blacklists 
          (jwt_blacklists_id, token_hash, expires_at) 
      VALUES 
          (UUID(), :token_hash, :expires_at)
    ");

    $stmt->execute([
      ':token_hash' => $tokenHash,
      ':expires_at' => $expiresAt->format('Y-m-d H:i:s')
    ]);
  }

  public function isTokenBlacklisted(string $token): bool
  {
    $pdo = $this->database->getConnection();
    $tokenHash = hash('sha256', $token);

    $stmt = $pdo->prepare("
      SELECT 1 FROM jwt_blacklists 
      WHERE token_hash = :token_hash 
      AND expires_at > NOW()
      LIMIT 1
    ");

    $stmt->execute([':token_hash' => $tokenHash]);
    return (bool) $stmt->fetchColumn();
  }
}