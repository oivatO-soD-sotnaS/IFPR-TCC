<?php
namespace App\Models;

class ForumMessage implements \JsonSerializable {
    private $forum_messages_id;
    private $content;
    private $created_at;
    private $changed_at;
    private $sent_by;
    private $subject_id;

    public function __construct(array $data = []) {
        $this->forum_messages_id = $data['forum_messages_id'] ?? '';
        $this->content = $data['content'] ?? '';
        $this->created_at = $data['created_at'] ?? date('Y-m-d H:i:s');
        $this->changed_at = $data['changed_at'] ?? date('Y-m-d H:i:s');
        $this->sent_by = $data['sent_by'] ?? null;
        $this->subject_id = $data['subject_id'] ?? '';
    }

    public function toArray(): array {
        return [
            'forum_messages_id' => $this->forum_messages_id,
            'content' => $this->content,
            'created_at' => $this->created_at,
            'changed_at' => $this->changed_at,
            'sent_by' => $this->sent_by,
            'subject_id' => $this->subject_id
        ];
    }

    public function jsonSerialize(): array {
        return $this->toArray();
    }

    // Getters
    public function getForumMessagesId(): string { return $this->forum_messages_id; }
    public function getContent(): string { return $this->content; }
    public function getCreatedAt(): string { return $this->created_at; }
    public function getChangedAt(): string { return $this->changed_at; }
    public function getSentBy(): ?string { return $this->sent_by; }
    public function getSubjectId(): string { return $this->subject_id; }
}