# Sistema de Gerenciamento de Livros para Biblioteca Télos

## Contexto do Desafio

Os alunos serão desafiados a desenvolver um sistema de gerenciamento de livros para uma biblioteca fictícia, a Biblioteca Télos. O sistema deve permitir que os usuários (bibliotecários) realizem operações de empréstimo e devolução de livros, além de gerenciar o catálogo de livros e os registros de usuários.

## Objetivo

Criar um sistema completo de gerenciamento de livros, incluindo as funcionalidades de:
- Adicionar, atualizar, excluir e buscar livros
- Gerenciar registros de usuários
- Realizar empréstimos e devoluções
- Gerar relatórios utilizando joins e subqueries

## Competências/Conhecimentos Técnicos Trabalhados e Avaliados

- **Modelagem de Dados**: Criação e normalização de tabelas para armazenar informações sobre livros, usuários, empréstimos e devoluções.
- **Constraints**: Uso de chaves primárias, estrangeiras e outras constraints para garantir a integridade dos dados.
- **Relacionamento de Tabelas**: Criação de relações entre tabelas para modelar adequadamente o sistema.
- **Queries Básicas**: Inserção, atualização, exclusão e consulta de dados.
- **Joins**: Uso de diferentes tipos de joins para obter informações combinadas de múltiplas tabelas.
- **Subqueries**: Utilização de subqueries para consultas complexas.
- **Functions & Procedures**: Criação de funções e procedimentos armazenados para operações comuns.
- **Aggregate Functions**: Uso de funções agregadas para gerar relatórios.

## Descrição Detalhada do Simulador

### Tabelas Necessárias

1. **Books (Livros)**
   - `book_id` (Primary Key)
   - `title`
   - `author`
   - `genre`
   - `published_year`

2. **Users (Usuários)**
   - `user_id` (Primary Key)
   - `name`
   - `email`

3. **Loans (Empréstimos)**
   - `loan_id` (Primary Key)
   - `book_id` (Foreign Key)
   - `user_id` (Foreign Key)
   - `loan_date`
   - `return_date`

### Funcionalidades Requeridas

#### Gerenciamento de Livros:
- Adicionar novos livros ao catálogo.
- Atualizar informações de livros existentes.
- Excluir livros do catálogo.
- Buscar livros no catálogo por título, autor, gênero, etc.

#### Gerenciamento de Usuários:
- Adicionar novos usuários.
- Atualizar informações de usuários existentes.
- Excluir usuários.
- Buscar usuários por nome, email, etc.

#### Empréstimo de Livros:
- Registrar empréstimos de livros.
- Registrar devoluções de livros.
- Verificar a disponibilidade de um livro antes de realizar um empréstimo.

#### Relatórios:
- Gerar relatórios de livros emprestados e devolvidos.
- Gerar relatórios de livros atualmente emprestados.
- Gerar relatórios de usuários com mais empréstimos.

## Estrutura do Projeto

1. **Modelagem de Dados**
   - Tabelas: Livros, Usuários, Empréstimos, Devoluções
   - Normalização: Aplicação de regras de normalização para evitar redundância e garantir a integridade dos dados

2. **Operações CRUD**
   - Livros: Adicionar, atualizar, excluir e buscar livros
   - Usuários: Gerenciar registros de usuários

3. **Empréstimos e Devoluções**
   - Registro de empréstimos e devoluções de livros

4. **Relatórios**
   - Geração de relatórios utilizando joins e subqueries

## Tecnologias Utilizadas

- Banco de Dados: MySQL, PostgreSQL ou outro SGBD relacional
- Linguagem de Programação: SQL para manipulação de dados
- Ferramentas de Desenvolvimento: IDEs, ferramentas de modelagem de dados

## Como Contribuir

1. Faça um fork deste repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nome-da-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Faça um push para a branch (`git push origin feature/nome-da-feature`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para mais detalhes.
