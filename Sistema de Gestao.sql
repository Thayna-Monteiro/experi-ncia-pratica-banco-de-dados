-------------------
-- CRIACAO_DO_BANCO
-------------------
CREATE DATABASE SE_PREPARE;
USE SE_PREPARE;
--------------------
-- TABELA: ALUNO
--------------------
CREATE TABLE ALUNO(
ID_ALUNO INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR (100) NOT NULL,
IDADE INT NOT NULL CHECK (IDADE>=12),
STATUS VARCHAR (50)
);
--------------------
-- TABELA ASSOCIATIVA: CURSO X ALUNO: ESTA MATRICULADO
--------------------
CREATE TABLE ESTA_MATRICULADO(
ID_MATRICULA INT AUTO_INCREMENT PRIMARY KEY,
ID_CURSO INT NOT NULL,
ID_ALUNO INT NOT NULL,
DATA_MATRICULA DATE,
FOREIGN KEY (ID_CURSO) REFERENCES CURSO(ID_CURSO),
FOREIGN KEY (ID_ALUNO) REFERENCES ALUNO(ID_ALUNO)
);
------------------------
-- TABELA: CURSO
------------------------
CREATE TABLE CURSO(
ID_CURSO INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR (100) NOT NULL,
CARGA_HORARIA INT NOT NULL,
DESCRICAO TEXT ,
DATA_CADASTRO DATE NOT NULL
);
-----------------------
-- TABELA: PROFESSOR
-----------------------
CREATE TABLE PROFESSOR(
ID_PROFESSOR INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR (100) NOT NULL,
STATUS VARCHAR (50)
);
----------------------
-- TABELA: ACESSO
----------------------
CREATE TABLE ACESSO(
ID_ACESSO INT AUTO_INCREMENT PRIMARY KEY,
ID_ALUNO INT NOT NULL,
ID_PROFESSOR INT NOT NULL,
DATA_HORA DATETIME,
IP VARCHAR (45),
FOREIGN KEY (ID_ALUNO) REFERENCES ALUNO(ID_ALUNO),
FOREIGN KEY (ID_PROFESSOR) REFERENCES PROFESSOR(ID_PROFESSOR)
);
-------------------------
-- INSERTS PARA POVOAR TABELA
-------------------------
-- CURSO
INSERT INTO CURSO (NOME, CARGA_HORARIA, DESCRICAO, DATA_CADASTRO) 
VALUES
('Informática Básica', 40, 'Curso inicial de informática', '2025-01-15'),
('Excel Avançado', 60, 'Planilhas avançadas', '2025-02-01'),
('Introdução à Programação', 50, 'Fundamentos de lógica e programação', '2025-01-20'),
('Informática Terceira Idade', 40, 'Curso para idade a partir de 60 anos', '2025-10-18'),
('Office 365', 90, 'Curso do pacote Office', '2025-10-18');
------------------
-- PROFESSOR
INSERT INTO Professor (Nome, Status) VALUES
('Carlos da Silva', 'ativo'),
('Fernanda Sales', 'ativo'),
('Luis Lobato', 'ativo'),
('Maria Carolina', 'ativo'),
('Alana Shimith', 'ativo');
------------------
-- ALUNO
INSERT INTO Aluno (Nome, Idade, Status) VALUES
('Tiago Cabral', 15, 'ativo'),
('Maria Eduarda', 18, 'ativo'),
('Gabriel Silva', 21, 'ativo'),
('Ana Pereira', 25, 'ativo'),
('Bruna Costa', 12, 'ativo'),
('João Ferreira', 60, 'ativo');
------------------
-- Possui (Curso x professor)
INSERT INTO Possui (ID_CURSO, ID_PROFESSOR) VALUES
(1,2),
(2,3),
(3,4),
(4,5),
(5,1);
-------------------
-- Esta Matriculado 
INSERT INTO Esta_Matriculado (ID_Curso, ID_Aluno, Data_Matricula) VALUES
(1,1, '2025-10-18'),
(2,2, '2025-10-18'),
(3,5, '2025-10-18'),
(4,3, '2025-10-18'),
(5,4, '2025-10-18');
--------------------
--- Acesso
INSERT INTO Acesso ( ID_Aluno, ID_Professor, Data_Hora, IP) VALUES
(1, 1, '2025-03-10 14:22:10', '192.168.0.10'),
(2, 2, '2025-03-08 09:11:55', '192.168.0.15'),
(3, 1, '2025-03-07 17:44:29', '192.168.0.22'),
(1, 2, '2025-03-10 16:05:08', '192.168.0.10');
--------------------
-- SELECT
--------------------
-- 1- Lista de Alunos com seus cursos
SELECT Aluno.Nome AS Aluno, Curso.Nome AS Curso, Esta_Matriculado.Data_matricula
FROM Possui
JOIN Curso ON Possui.ID_curso = Curso.ID_Curso
JOIN Professor ON Possui.ID_Professor = Professor.ID_Professor
ORDER BY Curso.nome ASC;
-------------------------
-- 2 - Cursos e seus professores
SELECT Curso.Nome AS Curso , Professor.Nome AS Professor
FROM Possui
JOIN Curso ON Possui.ID_curso = Curso.ID_Curso
JOIN Professor ON Possui.ID_Professor = Professor.ID_Professor
ORDER BY Curso.Nome ASC;
-------------------------
-- 3- Alunos ativos com idade maior que 14
SELECT Nome, Idade, STATUS
FROM Aluno
WHERE Status= 'ativo' AND idade >=14;
------------------------
-- UPDATES
------------------------
-- 1- Atualizar status de um aluno
UPDATE Aluno
SET Status = 'inativo'
WHERE ID_Aluno = 4;
-----------------------
-- 2- Atualizar carga horária de um curso
UPDATE Curso
SET Carga_Horaria= 80
WHERE ID_Curso= 2;
------------------------
-- 3- Atualizar nome do professor
UPDATE Professor
SET Nome= 'Carlos da Silva Pereira'
WHERE ID_Professor =1;
-----------------------------
-- DELETES
-----------------------------
-- 1- Remover registro de um acesso
DELETE FROM Acesso
WHERE ID_Acesso = 4;
-----------------------------
-- 2- Remover uma matricula
DELETE FROM Esta_Matriculado
WHERE ID_Matricula= 3;
-----------------------------
-- 3- Remover um professor inativo
DELETE FROM Professor
WHERE ID_Matricula= 1;





































