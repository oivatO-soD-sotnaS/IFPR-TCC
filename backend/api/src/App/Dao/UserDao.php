<?php

declare(strict_types=1);

namespace App\Dao;

use App\Database;
use App\Models\User;
use PDO;

class UserDao {
    public function __construct(private Database $database) {}

    public function getAll(): array {
      $pdo = $this->database->getConnection();
      $stmt = $pdo->query('SELECT * FROM users');
      $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $users = [];
      foreach ($results as $data) {
          $users[] = new User($data);
      }

      return $users;
    }

    public function getById(string $id): ?User {
      $sql = 'SELECT * FROM users WHERE user_id = :id';
      
      $pdo = $this->database->getConnection();
      $stmt = $pdo->prepare($sql);
      $stmt->bindValue(':id', $id, PDO::PARAM_STR); // Changed to PARAM_STR for UUID
      $stmt->execute();

      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      
      return $data ? new User($data) : null;
    }

    public function getByEmail(string $email): ?User {
      $sql = 'SELECT * FROM users WHERE email = :email';
      
      $pdo = $this->database->getConnection();
      $stmt = $pdo->prepare($sql);
      $stmt->bindValue(':email', $email, PDO::PARAM_STR);
      $stmt->execute();

      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      
      return $data ? new User($data) : null;
    }

    public function create(User $user): bool {
      $sql = 'INSERT INTO users (user_id, full_name, email, password_hash, profile_picture_id) 
              VALUES (:user_id, :full_name, :email, :password_hash, :profile_picture_id)';

      $pdo = $this->database->getConnection();
      $stmt = $pdo->prepare($sql);
      
      return $stmt->execute([
          ':user_id' => $user->getUserId(),
          ':full_name' => $user->getFullName(),
          ':email' => $user->getEmail(),
          ':password_hash' => $user->getPasswordHash(),
          ':profile_picture_id' => $user->getProfilePictureId()
      ]);
    }

    public function update(User $user): bool {
      $sql = 'UPDATE users SET 
              full_name = :full_name,
              email = :email,
              password_hash = :password_hash,
              email_verified = :email_verified,
              profile_picture_id = :profile_picture_id
              WHERE user_id = :user_id';

      $pdo = $this->database->getConnection();
      $stmt = $pdo->prepare($sql);
      
      return $stmt->execute([
          ':user_id' => $user->getUserId(),
          ':full_name' => $user->getFullName(),
          ':email' => $user->getEmail(),
          ':password_hash' => $user->getPasswordHash(),
          ':email_verified' => $user->isEmailVerified(),
          ':profile_picture_id' => $user->getProfilePictureId()
      ]);
    }

    public function delete(string $userId): bool {
      $sql = 'DELETE FROM users WHERE user_id = :user_id';

      $pdo = $this->database->getConnection();
      $stmt = $pdo->prepare($sql);
      
      return $stmt->execute([':user_id' => $userId]);
    }
}