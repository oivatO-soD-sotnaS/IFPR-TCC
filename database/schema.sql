USE `intellecta`;

-- Tabela de usuário
CREATE TABLE `users` (
  `id_user` CHAR(36) PRIMARY KEY,
  `full_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` ENUM ('active', 'deactivated') NOT NULL DEFAULT 'deactivated', -- 'active' significa que o usuário verificou o e-mail que utilizou ao criar a conta e 'deactivated' o contrário.
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_picture_url` VARCHAR(512) -- URL da imagem de perfil do usuário
);

-- Tabela de instituição
CREATE TABLE `institutions` (
  `id_institution` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(255),
  `description` TEXT,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da instituição
  `banner_url` VARCHAR(512), -- URL do banner da instituição
  `id_user` CHAR(36) NOT NULL, -- ID do usuário que criou a instituição
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Tabela de relação MxN entre User e Institution
CREATE TABLE `institution_users` (
  `id_institute_user` CHAR(36) PRIMARY KEY,
  `id_institution` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  `role` ENUM ('student', 'teacher', 'admin') NOT NULL DEFAULT 'student',
  `joined_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`id_institution`) REFERENCES `institutions`(`id_institution`) ON DELETE CASCADE,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE,
  UNIQUE (`id_institution`, `id_user`)
);

-- Tabela que armazena os convites de participação de uma instituição
CREATE TABLE `invitations` (
  `id_invitation` CHAR(36) NOT NULL PRIMARY KEY,
  `email` VARCHAR(255) NOT NULL,
  `role` ENUM ('student', 'teacher', 'admin') NOT NULL DEFAULT 'student',
  `token` CHAR(64) NOT NULL UNIQUE,
  `expires_at` DATETIME NOT NULL,
  `accepted_at` DATETIME DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_institution` CHAR(36) NOT NULL,
  -- Relação com a instituição (opcionalmente com FOREIGN KEY)
  FOREIGN KEY (`id_institution`) REFERENCES `institutions`(`id_institution`) ON DELETE CASCADE
);

-- Tabela de turma
CREATE TABLE `classes` (
  `id_class` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da turma
  `banner_url` VARCHAR(512), -- URL do banner da turma
  `id_institution` CHAR(36) NOT NULL, -- ID da instituição à qual a turma pertence
  FOREIGN KEY (`id_institution`) REFERENCES `institutions`(`id_institution`) ON DELETE CASCADE
);

-- Tabela de relação entre usuário e turma
CREATE TABLE `class_users` (
  `id_class_user` CHAR(36) PRIMARY KEY,
  `id_class` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL, -- ID do usuário participante da turma -- aluno.
  `joined_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`id_class`) REFERENCES `classes`(`id_class`) ON DELETE CASCADE,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Tabela de Disciplina
CREATE TABLE `subjects` (
  `id_subject` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da disciplina
  `banner_url` VARCHAR(512), -- URL do banner da disciplina
  `id_institution` CHAR(36) NOT NULL, -- ID da instituição à qual a disciplina pertence
  `id_user` CHAR(36) NOT NULL, -- ID do usuário que criou a disciplina -- Professor da disciplina.
  FOREIGN KEY (`id_institution`) REFERENCES `institutions`(`id_institution`) ON DELETE CASCADE,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Tabela de relação entre turma e disciplina
CREATE TABLE `subject_classes` (
  `id_subject_class` CHAR(36) PRIMARY KEY,
  `id_class` CHAR(36) NOT NULL,
  `id_subject` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_class`) REFERENCES `classes`(`id_class`) ON DELETE CASCADE,
  FOREIGN KEY (`id_subject`) REFERENCES `subjects`(`id_subject`) ON DELETE CASCADE
);

-- Tabela de material da disciplina
CREATE TABLE `materials` (
  `id_material` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `file_url` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_subject` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_subject`) REFERENCES `subjects`(`id_subject`) ON DELETE CASCADE
);

-- Tabela de atividade avaliativa
CREATE TABLE `assignments` (
  `id_assignment` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `deadline` DATE NOT NULL,
  `attachment` TEXT,
  `id_subject` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_subject`) REFERENCES `subjects`(`id_subject`) ON DELETE CASCADE
);

-- Tabela de entrega de atividade avaliativa
CREATE TABLE `submissions` (
  `id_submission` CHAR(36) PRIMARY KEY,
  `id_assignment` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  `submitted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` TEXT,
  `grade` DECIMAL,
  `concept` VARCHAR(255),
  `feedback` TEXT,
  FOREIGN KEY (`id_assignment`) REFERENCES `assignments`(`id_assignment`) ON DELETE CASCADE,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Tabela de mensgens do fórum de disciplina
CREATE TABLE `forum_messages` (
  `id_message` CHAR(36) PRIMARY KEY,
  `id_subject` CHAR(36) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`id_subject`) REFERENCES `subjects`(`id_subject`) ON DELETE CASCADE
);

-- Tabela 'pai' dos eventos. As outras 'herdam' dessa via padrão de composição.
CREATE TABLE `events` (
  `id_event` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `event_date` TIMESTAMP NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Eventos globais da instituição
CREATE TABLE `institutional_events` (
  `id_institutional_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_institution` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES `events`(`id_event`) ON DELETE CASCADE, 
  FOREIGN KEY (`id_institution`) REFERENCES `institutions`(`id_institution`) ON DELETE CASCADE
);

-- Eventos específicos de disciplina
CREATE TABLE `subject_events` (
  `id_subject_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_subject` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES `events`(`id_event`) ON DELETE CASCADE,
  FOREIGN KEY (`id_subject`) REFERENCES `subjects`(`id_subject`) ON DELETE CASCADE
);

-- Eventos específicos de usuário
CREATE TABLE `user_events` (
  `id_user_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES `events`(`id_event`) ON DELETE CASCADE,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Tabela de tokens JWT invalidados
CREATE TABLE `jwt_blacklists` (
  `id_jwt_blacklists` CHAR(36) NOT NULL PRIMARY KEY,
  `token` TEXT,
  `expires_at` DATETIME NOT NULL
);