USE `intellecta`;

-- Inserir dados na tabela `users`
INSERT INTO `users` (`id_user`, `full_name`, `email`, `password`, `status`, `profile_picture_url`) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice Smith', 'alice.smith@example.com', '$2b$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUV.abcdefghijk', 'active', 'https://example.com/alice.jpg'),
('b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22', 'Bob Johnson', 'bob.johnson@example.com', '$2b$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUV.lmnopqrstu', 'active', 'https://example.com/bob.jpg'),
('c2gdd2f8-a0b8-4c0f-9d4f-5e7c8f9d0b33', 'Charlie Brown', 'charlie.brown@example.com', '$2b$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUV.vwxyzabc', 'deactivated', NULL),
('d3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44', 'Diana Prince', 'diana.prince@example.com', '$2b$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUV.defghijk', 'active', 'https://example.com/diana.jpg'),
('e4iff4h0-c2d0-4e21-b16h-7g9e0h1f2d55', 'Ethan Hunt', 'ethan.hunt@example.com', '$2b$10$abcdefghijklmnopqrstuvABCDEFGHIJKLMNOPQRSTUV.lmnopqrs', 'active', NULL);

-- Inserir dados na tabela `institutions`
INSERT INTO `institutions` (`id_institution`, `name`, `email`, `phone_number`, `description`, `thumbnail_url`, `banner_url`, `id_user`) VALUES
('f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'Universidade Federal do Paraná (UFPR)', 'contato@ufpr.br', '(41) 3360-5000', 'Uma das mais antigas e renomadas universidades federais do Brasil.', 'https://example.com/ufpr_thumb.jpg', 'https://example.com/ufpr_banner.jpg', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'),
('g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77', 'Colégio Estadual do Paraná (CEP)', 'secretaria@cep.edu.br', '(41) 3234-1234', 'Tradicional colégio de ensino médio em Curitiba.', 'https://example.com/cep_thumb.jpg', 'https://example.com/cep_banner.jpg', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22'),
('h7lii7k3-f5g3-4h54-e49k-0j2h3k4i5g88', 'Escola Municipal de Artes', 'contato@emartes.org', '(45) 3523-5678', 'Escola focada no ensino de artes visuais e performáticas.', 'https://example.com/emartes_thumb.jpg', 'https://example.com/emartes_banner.jpg', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44');

-- Inserir dados na tabela `institution_users`
INSERT INTO `institution_users` (`id_institute_user`, `id_institution`, `id_user`, `role`) VALUES
('i8mjj8l4-g6h4-4i65-f5aj-1k3i4l5j6h99', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'admin'),
('j9nkk9m5-h7i5-4j76-g6bk-2l4j5m6k7i00', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22', 'teacher'),
('k0oll0n6-i8j6-4k87-h7cl-3m5k6n7l8j11', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44', 'student'),
('l1pmm1o7-j9k7-4l98-i8dm-4n6l7o8m9k22', 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22', 'admin'),
('m2qnn2p8-k0l8-4m09-j9en-5o7m8p9n0l33', 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77', 'e4iff4h0-c2d0-4e21-b16h-7g9e0h1f2d55', 'student');

-- Inserir dados na tabela `invitations`
INSERT INTO `invitations` (`id_invitation`, `email`, `role`, `token`, `expires_at`, `accepted_at`, `id_institution`) VALUES
('n3roo3q9-l1m9-4n10-k0fo-6p8n9q0o1m44', 'new.student@example.com', 'student', 'token123abc456def789ghi012jkl345mno678pqr901stu234vwx5', '2025-06-01 10:00:00', NULL, 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66'),
('o4spp4r0-m2n0-4o21-l1gp-7q9o0r1p2n55', 'potential.teacher@example.com', 'teacher', 'token234bcd567efg890ijk123lmn456opq789rst012uvw345xyz6', '2025-05-25 15:00:00', NULL, 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77');

-- Inserir dados na tabela `classes`
INSERT INTO `classes` (`id_class`, `name`, `description`, `thumbnail_url`, `banner_url`, `id_institution`) VALUES
('p5tqq5s1-n3o1-4p32-m2hq-8r0p1s2q3o66', 'Engenharia de Software I', 'Turma de introdução à Engenharia de Software.', 'https://example.com/eng_soft_thumb.jpg', 'https://example.com/eng_soft_banner.jpg', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66'),
('q6urr6t2-o4p2-4q43-n3ir-9s1q2t3r4p77', 'Matemática Avançada', 'Turma de cálculo diferencial e integral.', 'https://example.com/mat_av_thumb.jpg', 'https://example.com/mat_av_banner.jpg', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66'),
('r7vss7u3-p5q3-4r54-o4js-0t2r3u4s5q88', 'Língua Portuguesa - 3º Ano', 'Turma de Língua Portuguesa para o terceiro ano do ensino médio.', 'https://example.com/port_thumb.jpg', 'https://example.com/port_banner.jpg', 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77');

-- Inserir dados na tabela `class_users`
INSERT INTO `class_users` (`id_class_user`, `id_class`, `id_user`) VALUES
('s8wtt8v4-q6r4-4s65-p5kt-1u3s4v5t6r99', 'p5tqq5s1-n3o1-4p32-m2hq-8r0p1s2q3o66', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44'),
('t9xuu9w5-r7s5-4t76-q6lu-2v4t5w6u7s00', 'q6urr6t2-o4p2-4q43-n3ir-9s1q2t3r4p77', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44'),
('u0yvv0x6-s8t6-4u87-r7mv-3w5u6x7v8t11', 'r7vss7u3-p5q3-4r54-o4js-0t2r3u4s5q88', 'e4iff4h0-c2d0-4e21-b16h-7g9e0h1f2d55');

-- Inserir dados na tabela `subjects`
INSERT INTO `subjects` (`id_subject`, `name`, `description`, `thumbnail_url`, `banner_url`, `id_institution`, `id_user`) VALUES
('v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22', 'Desenvolvimento Web Back-end', 'Estudo de frameworks e tecnologias para desenvolvimento web no lado do servidor.', 'https://example.com/backend_thumb.jpg', 'https://example.com/backend_banner.jpg', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22'),
('w2abb2z8-u0v8-4w09-t9ox-5y7w8z9x0v33', 'Cálculo Numérico', 'Métodos numéricos para resolver problemas matemáticos.', 'https://example.com/calc_num_thumb.jpg', 'https://example.com/calc_num_banner.jpg', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22'),
('x3bcc3a9-v1w9-4x10-u0py-6z8x9a0y1w44', 'Literatura Brasileira', 'Análise de obras e autores da literatura brasileira.', 'https://example.com/lit_br_thumb.jpg', 'https://example.com/lit_br_banner.jpg', 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77', 'b1fcc1e7-9d7a-4b9e-8c3e-4d6b5e8c7a22');

-- Inserir dados na tabela `subject_classes`
INSERT INTO `subject_classes` (`id_subject_class`, `id_class`, `id_subject`) VALUES
('y4cdd4b0-w2x0-4y21-v1qz-7a9y0b1z2x55', 'p5tqq5s1-n3o1-4p32-m2hq-8r0p1s2q3o66', 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22'),
('z5dee5c1-x3y1-4z32-w2ra-8b0z1c2a3y66', 'q6urr6t2-o4p2-4q43-n3ir-9s1q2t3r4p77', 'w2abb2z8-u0v8-4w09-t9ox-5y7w8z9x0v33'),
('a6eff6d2-y4z2-4a43-x3sb-9c1a2d3b4z77', 'r7vss7u3-p5q3-4r54-o4js-0t2r3u4s5q88', 'x3bcc3a9-v1w9-4x10-u0py-6z8x9a0y1w44');

-- Inserir dados na tabela `materials`
INSERT INTO `materials` (`id_material`, `title`, `file_url`, `id_subject`) VALUES
('b7fgg7e3-z5a3-4b54-y4tc-0d2b3e4c5a88', 'Apresentação de Spring Boot', 'https://example.com/material/springboot_intro.pdf', 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22'),
('c8ghh8f4-a6b4-4c65-z5ud-1e3c4f5d6b99', 'Slides de Métodos de Newton', 'https://example.com/material/newton_slides.pptx', 'w2abb2z8-u0v8-4w09-t9ox-5y7w8z9x0v33'),
('d9iij9g5-b7c5-4d76-a6ve-2f4d5g6e7c00', 'Artigo sobre Modernismo', 'https://example.com/material/modernismo_artigo.doc', 'x3bcc3a9-v1w9-4x10-u0py-6z8x9a0y1w44');

-- Inserir dados na tabela `assignments`
INSERT INTO `assignments` (`id_assignment`, `title`, `description`, `deadline`, `attachment`, `id_subject`) VALUES
('e0jkk0h6-c8d6-4e87-b7wf-3g5e6h7f8d11', 'Projeto Final - API REST', 'Desenvolver uma API RESTful completa utilizando Spring Boot.', '2025-06-30', NULL, 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22'),
('f1kll1i7-d9e7-4f98-c8xg-4h6f7i8g9e22', 'Lista de Exercícios 1 - Cálculo Numérico', 'Resolver os exercícios da lista sobre resolução de equações não lineares.', '2025-06-15', 'https://example.com/assignment/lista1_calc_num.pdf', 'w2abb2z8-u0v8-4w09-t9ox-5y7w8z9x0v33'),
('g2lmm2j8-e0f8-4g09-d9yh-5i7g8j9h0f33', 'Análise Crítica - O Cortiço', 'Produzir uma análise crítica da obra "O Cortiço" de Aluísio Azevedo.', '2025-07-05', NULL, 'x3bcc3a9-v1w9-4x10-u0py-6z8x9a0y1w44');

-- Inserir dados na tabela `submissions`
INSERT INTO `submissions` (`id_submission`, `id_assignment`, `id_user`, `submitted_at`, `file`, `grade`, `concept`, `feedback`) VALUES
('h3mnn3k9-f1g9-4h10-e0zi-6j8h9k0i1g44', 'e0jkk0h6-c8d6-4e87-b7wf-3g5e6h7f8d11', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44', '2025-06-28 14:30:00', 'https://example.com/submission/projeto_alice.zip', 9.5, 'Excelente', 'Ótimo trabalho, com boa organização de código.'),
('i4noo4l0-g2h0-4i21-f1aj-7k9i0l1j2h55', 'f1kll1i7-d9e7-4f98-c8xg-4h6f7i8g9e22', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44', '2025-06-14 20:00:00', 'https://example.com/submission/lista1_diana.pdf', 8.0, 'Bom', 'Atenção aos detalhes em alguns cálculos.'),
('j5opp5m1-h3i1-4j32-g2bk-8l0j1m2k3i66', 'g2lmm2j8-e0f8-4g09-d9yh-5i7g8j9h0f33', 'e4iff4h0-c2d0-4e21-b16h-7g9e0h1f2d55', '2025-07-03 10:00:00', 'https://example.com/submission/analise_ethan.docx', NULL, NULL, NULL);

-- Inserir dados na tabela `forum_messages`
INSERT INTO `forum_messages` (`id_message`, `id_subject`, `content`) VALUES
('k6pqq6n2-i4j2-4k43-h3cl-9m1k2n3l4j77', 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22', 'Dúvida sobre configuração do banco de dados no Spring Boot.'),
('l7qrr7o3-j5k3-4l54-i4dm-0n2l3o4m5k88', 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22', 'Resposta: Verificar o arquivo application.properties.'),
('m8rss8p4-k6l4-4m65-j5en-1o3m4p5n6l99', 'x3bcc3a9-v1w9-4x10-u0py-6z8x9a0y1w44', 'Qual a principal característica do Naturalismo em "O Cortiço"?');

-- Inserir dados na tabela `events`
INSERT INTO `events` (`id_event`, `title`, `description`, `event_date`) VALUES
('n9stt9q5-l7m5-4n76-k6fo-2p4n5q6o7m00', 'Palestra: Carreira em TI', 'Palestra com profissionais da área de Tecnologia da Informação.', '2025-07-10 19:00:00'),
('o0uww0r6-m8n6-4o87-l7gp-3q5o6r7p8n11', 'Seminário de Pesquisa', 'Apresentação de projetos de pesquisa dos alunos.', '2025-08-01 09:00:00'),
('p1vxx1s7-n9o7-4p98-m8hq-4r6p7s8q9o22', 'Prazo Final do Projeto', 'Entrega final do Projeto de Desenvolvimento Web.', '2025-06-30 23:59:59');

-- Inserir dados na tabela `institutional_events`
INSERT INTO `institutional_events` (`id_institutional_event`, `id_event`, `id_institution`) VALUES
('q2yzz2t8-o0p8-4q09-n9ir-5s7q8t9r0p33', 'n9stt9q5-l7m5-4n76-k6fo-2p4n5q6o7m00', 'f5jgg5i1-d3e1-4f32-c27i-8h0f1i2g3e66'),
('r3aab3u9-p1q9-4r10-o0js-6t8r9u0s1q44', 'o0uww0r6-m8n6-4o87-l7gp-3q5o6r7p8n11', 'g6khh6j2-e4f2-4g43-d38j-9i1g2j3h4f77');

-- Inserir dados na tabela `subject_events`
INSERT INTO `subject_events` (`id_subject_event`, `id_event`, `id_subject`) VALUES
('s4bcc4v0-q2r0-4s21-p1kt-7u9s0v1t2r55', 'p1vxx1s7-n9o7-4p98-m8hq-4r6p7s8q9o22', 'v1zaa1y7-t9u7-4v98-s8nw-4x6v7y8w9u22');

-- Inserir dados na tabela `user_events`
INSERT INTO `user_events` (`id_user_event`, `id_event`, `id_user`) VALUES
('t5cdd5w1-r3s1-4t32-q2lu-8v0t1w2v3s66', 'p1vxx1s7-n9o7-4p98-m8hq-4r6p7s8q9o22', 'd3hee3g9-b1c9-4d10-a05g-6f8d9g0e1c44');

-- Inserir dados na tabela `jwt_blacklists`
INSERT INTO `jwt_blacklists` (`id_jwt_blacklists`, `token`, `expires_at`) VALUES
('u6dee6x2-s4t2-4u43-r3mv-9w1u2x3w4t77', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c', '2025-05-20 10:00:00');