# Bem-vindo!
---
Olá, seja bem-vindo ao repositório da aplicação '***Intellecta***'.

Desenvolvida por Otávio dos Santos Lima e Davyd Samuel de Oliveira Viana, esta é uma aplicação de ensino digital implementada utilizando PHP no back-end, React/Next.js no front-end e MySQL como sistema de gerenciamento de banco de dados relacional.

A Intellecta foi conceituada em um momento de estresse dos desenvolvedores com relação à multiplicidade de vias comunicaticas entre professor e aluno no IFPR - Foz do Iguaçu. Problema esse que pode ser observado na grande quantia de grupos de WhatsApp (por matéria), turmas no Google Classroom, SUAP, AVA, etc., etc. Portanto, de forma a solucionar essa fragmentação aborrecível de meios comunicativos, nos quais ambos aluno e professor tem dificuldade em manter, fez-se o nosso projeto de conclusão de curso.

Mais do que uma plataforma de ensino, a Intellecta, ao utilizar das mais recentes tecnologias para desenvolvimento web e em conjunto com um interface e experiência de usuário modernas, traz um ambiente de ensino digital com foco na facilidade de comunicação entre discente e docente.

Dito isso, segue abaixo uma lista de comandos para utilizar da aplicação de forma correta e fácil.

> Este repositório permanecerá recebendo atualizações até o dia 15/12/2025.

## Inicializando a aplicação
```bash
sudo docker compose up --build
```
## Encerrando a aplicação
```bash
sudo docker compose down
```
## Para instalar novas dependências no *front-end*
```bash
sudo docker exec -it frontend_container npm install <nome-da-dependencia>
```
## Para instalar novas dependências no *back-end*
```bash
sudo docker exec -it backend_container composer require <pacote>
```
## Como acessar a base de dados
```bash
mysql -u root -p -P 3306 -h 127.0.0.1
```
Conforme definido dentro de *docker-composer.yml*, a senha do usuário root — por padrão — é 'SegredoInsano'.
Os arquivos de esquema da base de dados e dos dados simulados se encontra dentro do diretório './database'.
