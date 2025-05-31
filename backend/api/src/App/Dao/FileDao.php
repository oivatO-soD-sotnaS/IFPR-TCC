<?php

declare(strict_types= 1);

namespace App\Dao;

use App\Database;
use PDO;

class FileDao {

  public function __construct(private Database $database) {}

  public function getAll(): array {
    $pdo = $this->database->getConnection();

    $stmt = $pdo->query('SELECT * FROM files');

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $data;
  }

  public function getById(string $id): array|bool {
    $sql = 'SELECT * FROM files WHERE file_id = :id';
    
    $pdo = $this->database->getConnection();

    $stmt = $pdo->prepare($sql);
    $stmt ->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt ->execute();

    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    return $data;
  }
}