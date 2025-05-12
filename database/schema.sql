USE `intellecta`;

-- Tabela de usuário
CREATE TABLE `User` (
  `id_user` CHAR(36) PRIMARY KEY,
  `full_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` ENUM ('active', 'deactivated') NOT NULL DEFAULT 'deactivated', -- 'active' significa que o usuário verificou o e-mail que utilizou ao criar a conta, 'deactivated', o contrário.
  `created_at` TIMESTAMP NOT NULL,
  `changed_at` TIMESTAMP NOT NULL,
  `profile_picture_url` VARCHAR(512) -- URL da imagem de perfil do usuário
);

-- Tabela de instituição
CREATE TABLE `Institute` (
  `id_institute` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(255),
  `description` TEXT,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da instituição
  `banner_url` VARCHAR(512), -- URL do banner da instituição
  `id_user` CHAR(36) NOT NULL, -- ID do usuário que criou a instituição
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`)
);

-- Tabela de relação MxN entre User e Institute
CREATE TABLE `InstitutionUser` (
  `id_institute_user` CHAR(36) PRIMARY KEY,
  `id_institute` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  `role` ENUM ('student', 'teacher', 'admin') NOT NULL DEFAULT 'student',
  `joined_at` TIMESTAMP NOT NULL,
  FOREIGN KEY (`id_institute`) REFERENCES Institute(`id_institute`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`),
  UNIQUE (`id_institute`, `id_user`)
);

-- Tabela de turma
CREATE TABLE `Class` (
  `id_class` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da turma
  `banner_url` VARCHAR(512), -- URL do banner da turma
  `id_institute` CHAR(36) NOT NULL, -- ID da instituição à qual a turma pertence
  FOREIGN KEY (`id_institute`) REFERENCES Institute(`id_institute`)
);

-- Tabela de relação entre usuário e turma
CREATE TABLE `ClassUser` (
  `id_class_user` CHAR(36) PRIMARY KEY,
  `id_class` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL, -- ID do usuário participante da turma -- aluno.
  `joined_at` TIMESTAMP,
  FOREIGN KEY (`id_class`) REFERENCES Class(`id_class`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`)
);

-- Tabela de Disciplina
CREATE TABLE `Discipline` (
  `id_discipline` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `thumbnail_url` VARCHAR(512), -- URL da imagem de perfil da disciplina
  `banner_url` VARCHAR(512), -- URL do banner da disciplina
  `id_institute` CHAR(36) NOT NULL, -- ID da instituição à qual a disciplina pertence
  `id_user` CHAR(36) NOT NULL, -- ID do usuário que criou a disciplina -- Professor da disciplina.
  FOREIGN KEY (`id_institute`) REFERENCES Institute(`id_institute`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`)
);

-- Tabela de relação entre turma e disciplina
CREATE TABLE `DisciplineClass` (
  `id_discipline_class` CHAR(36) PRIMARY KEY,
  `id_class` CHAR(36) NOT NULL,
  `id_discipline` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_class`) REFERENCES Class(`id_class`),
  FOREIGN KEY (`id_discipline`) REFERENCES Discipline(`id_discipline`)
);

-- Tabela de material da disciplina
CREATE TABLE `Material` (
  `id_material` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `file_url` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `changed_at` TIMESTAMP NOT NULL,
  `id_discipline` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_discipline`) REFERENCES Discipline(`id_discipline`)
);

-- Tabela de atividade avaliativa
CREATE TABLE `Assignment` (
  `id_assignment` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `deadline` DATE NOT NULL,
  `attachment` TEXT,
  `id_discipline` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_discipline`) REFERENCES Discipline(`id_discipline`)
);

-- Tabela de entrega de atividade avaliativa
CREATE TABLE `Submission` (
  `id_submission` CHAR(36) PRIMARY KEY,
  `id_assignment` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  `submitted_at` TIMESTAMP,
  `file` TEXT,
  `grade` DECIMAL,
  `concept` VARCHAR(255),
  `feedback` TEXT,
  FOREIGN KEY (`id_assignment`) REFERENCES Assignment(`id_assignment`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`)
);

-- Tabela de mensgens do fórum de disciplina
CREATE TABLE `ForumMessage` (
  `id_message` CHAR(36) PRIMARY KEY,
  `id_discipline` CHAR(36) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `changed_at` TIMESTAMP NOT NULL,
  FOREIGN KEY (`id_discipline`) REFERENCES Discipline(`id_discipline`)
);

-- Tabela 'pai' dos eventos. As outras 'herdam' dessa via padrão de composição.
CREATE TABLE `Event` (
  `id_event` CHAR(36) PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `event_date` TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL,
  `changed_at` TIMESTAMP NOT NULL
);

-- Eventos globais da instituição
CREATE TABLE `InstitutionalEvent` (
  `id_institutional_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_institute` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES Event(`id_event`), 
  FOREIGN KEY (`id_institute`) REFERENCES Institute(`id_institute`)
);

-- Eventos específicos de disciplina
CREATE TABLE `DisciplineEvent` (
  `id_discipline_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_discipline` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES Event(`id_event`),
  FOREIGN KEY (`id_discipline`) REFERENCES Discipline(`id_discipline`)
);

-- Eventos específicos de usuário
CREATE TABLE `UserEvent` (
  `id_user_event` CHAR(36) PRIMARY KEY,
  `id_event` CHAR(36) NOT NULL,
  `id_user` CHAR(36) NOT NULL,
  FOREIGN KEY (`id_event`) REFERENCES Event(`id_event`),
  FOREIGN KEY (`id_user`) REFERENCES User(`id_user`)
);