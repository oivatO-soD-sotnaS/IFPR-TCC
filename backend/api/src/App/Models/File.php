<?php
namespace App\Models;

class File implements \JsonSerializable {
    private $file_id;
    private $url;
    private $filename;
    private $mime_type;
    private $size;
    private $uploaded_at;

    public function __construct(array $data = []) {
        $this->file_id = $data['file_id'] ?? '';
        $this->url = $data['url'] ?? '';
        $this->filename = $data['filename'] ?? '';
        $this->mime_type = $data['mime_type'] ?? null;
        $this->size = $data['size'] ?? null;
        $this->uploaded_at = $data['uploaded_at'] ?? date('Y-m-d H:i:s');
    }

    public function toArray(): array {
        return [
            'file_id' => $this->file_id,
            'url' => $this->url,
            'filename' => $this->filename,
            'mime_type' => $this->mime_type,
            'size' => $this->size,
            'uploaded_at' => $this->uploaded_at
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getFileId(): string { return $this->file_id; }
    public function getUrl(): string { return $this->url; }
    public function getFilename(): string { return $this->filename; }
    public function getMimeType(): ?string { return $this->mime_type; }
    public function getSize(): ?int { return $this->size; }
    public function getUploadedAt(): string { return $this->uploaded_at; }
}