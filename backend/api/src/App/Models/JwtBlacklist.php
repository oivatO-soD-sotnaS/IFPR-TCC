<?php
namespace App\Models;

class JwtBlacklist implements \JsonSerializable {
    private $jwt_blacklists_id;
    private $token;
    private $expires_at;

    public function __construct(array $data = []) {
        $this->jwt_blacklists_id = $data['jwt_blacklists_id'] ?? '';
        $this->token = $data['token'] ?? '';
        $this->expires_at = $data['expires_at'] ?? '';
    }

    public function toArray(): array {
        return [
            'jwt_blacklists_id' => $this->jwt_blacklists_id,
            // Exclude token from serialization for security
            'expires_at' => $this->expires_at
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getJwtBlacklistsId(): string { return $this->jwt_blacklists_id; }
    public function getToken(): string { return $this->token; }
    public function getExpiresAt(): string { return $this->expires_at; }

    public function isExpired(): bool {
        return strtotime($this->expires_at) < time();
    }
}