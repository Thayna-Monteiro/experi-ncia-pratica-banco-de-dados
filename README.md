# Sistema de Gestão de Cursos — Banco de Dados (Se Prepare)

Este repositório contém o banco de dados do sistema “Se Prepare”, desenvolvido para gerenciar cursos, alunos, professores e acessos ao sistema.  
O modelo foi construído utilizando técnicas de modelagem conceitual, normalização e implementação em SQL (MySQL).

---

## Estrutura do Repositório
sql/

│ 01_create_tables.sql

│ 02_insert_data.sql

│ 03_select_queries.sql

│ 04_update_queries.sql

│ 05_delete_queries.sql

docs/

│ DER.png

│README.md

│Sistema_de_Gestao.SQL

---

Objetivo do Projeto
Este banco de dados foi criado como parte da modelagem e implementação do sistema educacional “Se Prepare”, que oferece cursos de informática e inclusão digital.  

O objetivo é fornecer uma estrutura relacional robusta para:

- Cadastro de alunos e professores  
- Gerenciamento de cursos  
- Registro de matrículas  
- Controle de acessos ao sistema  
- Consultas analíticas e administrativas  

---

## Tecnologias Utilizadas

- MySQL 8+
- Modelagem DER
- Normalização até 3FN
- Git & GitHub

---

## **Como Executar o Projeto**

1. Abra o MySQL Workbench ou outro cliente MySQL
   
3. Execute os scripts na ordem recomendada

source sql/01_create_tables.sql;

source sql/02_insert_data.sql;

source sql/03_select_queries.sql;

source sql/04_update_queries.sql;

source sql/05_delete_queries.sql;

Cada arquivo contém uma parte específica da implementação para garantir clareza e modularidade.

---
## Modelo ER do Banco de Dados

A imagem do DER utilizado no projeto está disponível em:

docs/DER.png


Scripts Disponíveis
-----
01_create_tables.sql

Criação do banco

Criação das tabelas

Chaves primárias e estrangeiras

Regras (CHECK idade ≥ 12)

Tabelas associativas (M:N)


------
02_insert_data.sql

Povoamento inicial:

Cursos

Professores

Alunos

Matrículas

Acessos

--------------
03_select_queries.sql

Consultas utilizando:
JOIN
WHERE
ORDER BY

--------------
04_update_queries.sql

Atualizações como:

Alterar status de aluno

Atualizar carga horária

Alterar nome de professor

---------------
05_delete_queries.sql

Remoções com condições, incluindo:
Acessos

Matrículas

Professores inativos

--------------
## **Exemplos de Consultas (incluídas nos scripts)**

**Listar alunos e seus cursos:**

SELECT Aluno.Nome, Curso.Nome, Esta_Matriculado.Data_matricula

FROM Esta_Matriculado

JOIN Aluno ON Esta_Matriculado.ID_aluno = Aluno.ID_aluno

JOIN Curso ON Esta_Matriculado.ID_curso = Curso.ID_curso;

**Últimos acessos:**

SELECT  FROM Acesso ORDER BY Data_Hora DESC LIMIT 5;

---


Projeto desenvolvido por Thayná Monteiro

