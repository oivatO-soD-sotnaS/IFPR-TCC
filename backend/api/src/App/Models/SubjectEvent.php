<?php
namespace App\Models;

class SubjectEvent implements \JsonSerializable {
    private $subject_events_id;
    private $event_id;
    private $subject_id;

    public function __construct(array $data = []) {
        $this->subject_events_id = $data['subject_events_id'] ?? '';
        $this->event_id = $data['event_id'] ?? '';
        $this->subject_id = $data['subject_id'] ?? '';
    }

    public function toArray(): array {
        return [
            'subject_events_id' => $this->subject_events_id,
            'event_id' => $this->event_id,
            'subject_id' => $this->subject_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getSubjectEventsId(): string { return $this->subject_events_id; }
    public function getEventId(): string { return $this->event_id; }
    public function getSubjectId(): string { return $this->subject_id; }
}