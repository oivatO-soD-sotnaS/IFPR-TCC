<?php
namespace App\Models;

class Event implements \JsonSerializable {
    private $event_id;
    private $title;
    private $description;
    private $type;
    private $event_date;
    private $created_at;
    private $changed_at;

    public function __construct(array $data = []) {
        $this->event_id = $data['event_id'] ?? '';
        $this->title = $data['title'] ?? '';
        $this->description = $data['description'] ?? null;
        $this->type = $data['type'] ?? 'other';
        $this->event_date = $data['event_date'] ?? '';
        $this->created_at = $data['created_at'] ?? date('Y-m-d H:i:s');
        $this->changed_at = $data['changed_at'] ?? date('Y-m-d H:i:s');
    }

    public function toArray(): array {
        return [
            'event_id' => $this->event_id,
            'title' => $this->title,
            'description' => $this->description,
            'type' => $this->type,
            'event_date' => $this->event_date,
            'created_at' => $this->created_at,
            'changed_at' => $this->changed_at
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getEventId(): string { return $this->event_id; }
    public function getTitle(): string { return $this->title; }
    public function getDescription(): ?string { return $this->description; }
    public function getType(): string { return $this->type; }
    public function getEventDate(): string { return $this->event_date; }
    public function getCreatedAt(): string { return $this->created_at; }
    public function getChangedAt(): string { return $this->changed_at; }

    public function isUpcoming(): bool {
        return strtotime($this->event_date) > time();
    }
}