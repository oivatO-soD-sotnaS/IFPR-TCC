<?php
namespace App\Models;

class User implements \JsonSerializable {
    private $user_id;
    private $full_name;
    private $email;
    private $password_hash;
    private $email_verified;
    private $created_at;
    private $changed_at;
    private $profile_picture_id;

    public function __construct(array $data = []) {
        $this->user_id = $data['user_id'] ?? '';
        $this->full_name = $data['full_name'] ?? '';
        $this->email = $data['email'] ?? '';
        $this->password_hash = $data['password_hash'] ?? '';
        $this->email_verified = $data['email_verified'] ?? false;
        $this->created_at = $data['created_at'] ?? date('Y-m-d H:i:s');
        $this->changed_at = $data['changed_at'] ?? date('Y-m-d H:i:s');
        $this->profile_picture_id = $data['profile_picture_id'] ?? null;
    }

    public function toArray(): array {
        return [
            'user_id' => $this->user_id,
            'full_name' => $this->full_name,
            'email' => $this->email,
            'email_verified' => $this->email_verified,
            'created_at' => $this->created_at,
            'changed_at' => $this->changed_at,
            'profile_picture_id' => $this->profile_picture_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getUserId(): string { return $this->user_id; }
    public function getFullName(): string { return $this->full_name; }
    public function getEmail(): string { return $this->email; }
    public function getPasswordHash(): string { return $this->password_hash; }
    public function isEmailVerified(): bool { return $this->email_verified; }
    public function getCreatedAt(): string { return $this->created_at; }
    public function getChangedAt(): string { return $this->changed_at; }
    public function getProfilePictureId(): ?string { return $this->profile_picture_id; }
}