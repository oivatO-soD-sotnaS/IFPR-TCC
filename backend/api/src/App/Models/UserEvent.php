<?php
namespace App\Models;

class UserEvent implements \JsonSerializable {
    private $user_events_id;
    private $event_id;
    private $user_id;

    public function __construct(array $data = []) {
        $this->user_events_id = $data['user_events_id'] ?? '';
        $this->event_id = $data['event_id'] ?? '';
        $this->user_id = $data['user_id'] ?? '';
    }

    public function toArray(): array {
        return [
            'user_events_id' => $this->user_events_id,
            'event_id' => $this->event_id,
            'user_id' => $this->user_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getUserEventsId(): string { return $this->user_events_id; }
    public function getEventId(): string { return $this->event_id; }
    public function getUserId(): string { return $this->user_id; }
}