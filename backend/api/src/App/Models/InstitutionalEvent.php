<?php
namespace App\Models;

class InstitutionalEvent implements \JsonSerializable {
    private $institutional_events_id;
    private $event_id;
    private $institution_id;

    public function __construct(array $data = []) {
        $this->institutional_events_id = $data['institutional_events_id'] ?? '';
        $this->event_id = $data['event_id'] ?? '';
        $this->institution_id = $data['institution_id'] ?? '';
    }

    public function toArray(): array {
        return [
            'institutional_events_id' => $this->institutional_events_id,
            'event_id' => $this->event_id,
            'institution_id' => $this->institution_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getInstitutionalEventsId(): string { return $this->institutional_events_id; }
    public function getEventId(): string { return $this->event_id; }
    public function getInstitutionId(): string { return $this->institution_id; }
}