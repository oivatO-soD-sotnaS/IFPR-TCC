<?php
namespace App\Models;

class Material implements \JsonSerializable {
    private $material_id;
    private $title;
    private $created_at;
    private $changed_at;
    private $subject_id;
    private $file_id;

    public function __construct(array $data = []) {
        $this->material_id = $data['material_id'] ?? '';
        $this->title = $data['title'] ?? '';
        $this->created_at = $data['created_at'] ?? date('Y-m-d H:i:s');
        $this->changed_at = $data['changed_at'] ?? date('Y-m-d H:i:s');
        $this->subject_id = $data['subject_id'] ?? '';
        $this->file_id = $data['file_id'] ?? '';
    }

    public function toArray(): array {
        return [
            'material_id' => $this->material_id,
            'title' => $this->title,
            'created_at' => $this->created_at,
            'changed_at' => $this->changed_at,
            'subject_id' => $this->subject_id,
            'file_id' => $this->file_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getMaterialId(): string { return $this->material_id; }
    public function getTitle(): string { return $this->title; }
    public function getCreatedAt(): string { return $this->created_at; }
    public function getChangedAt(): string { return $this->changed_at; }
    public function getSubjectId(): string { return $this->subject_id; }
    public function getFileId(): string { return $this->file_id; }
}