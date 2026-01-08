-- Script de criação do banco de dados para Gestão de Tarefas

-- Criação do banco de dados
CREATE DATABASE GestaoTarefas;
use gestaotarefas;

-- Criação das tabelas principais
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Status (
    StatusID INT PRIMARY KEY IDENTITY(1,1),
    Descricao NVARCHAR(50) NOT NULL
);

CREATE TABLE Tarefas (
    TarefaID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(200) NOT NULL,
    Descricao NVARCHAR(500),
    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
    DataPrazo DATETIME NOT NULL,
    StatusID INT NOT NULL,
    UsuarioID INT NOT NULL,
    FOREIGN KEY (StatusID) REFERENCES Status(StatusID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Inserção de dados iniciais
INSERT INTO Status (Descricao) VALUES ('Pendente'), ('Em andamento'), ('Concluída'), ('Atrasada');

INSERT INTO Usuarios (Nome, Email) VALUES
('João Silva', 'joao@exemplo.com'),
('Maria Souza', 'maria@exemplo.com'),
('Carlos Lima', 'carlos@exemplo.com');

-- Exemplo de inserção de tarefas
INSERT INTO Tarefas (Titulo, Descricao, DataPrazo, StatusID, UsuarioID) VALUES
('Estudar SQL', 'Revisar comandos básicos de SQL', DATEADD(DAY, 2, GETDATE()), 1, 1),
('Criar procedure de atualização', 'Desenvolver procedure para atualizar tarefas', DATEADD(DAY, 5, GETDATE()), 2, 2),
('Documentar projeto', 'Escrever documentação no README', DATEADD(DAY, 1, GETDATE()), 1, 3);

/*
-- View: Tarefas atrasadas
CREATE VIEW vw_TarefasAtrasadas AS
SELECT T.TarefaID, T.Titulo, T.DataPrazo, U.Nome AS Responsavel
FROM Tarefas T
INNER JOIN Usuarios U ON T.UsuarioID = U.UsuarioID
WHERE T.DataPrazo < GETDATE() AND T.StatusID <> 3;

-- Procedure: Atualizar status de tarefa
CREATE PROCEDURE AtualizarStatusTarefa
    @TarefaID INT,
    @NovoStatusID INT
AS
BEGIN
    UPDATE Tarefas
    SET StatusID = @NovoStatusID
    WHERE TarefaID = @TarefaID;
END;

-- Trigger: Marcar tarefa como atrasada automaticamente
CREATE TRIGGER trg_MarcarAtrasada
ON Tarefas
AFTER UPDATE
AS
BEGIN
    UPDATE Tarefas
    SET StatusID = 4 -- Atrasada
    WHERE DataPrazo < GETDATE() AND StatusID <> 3;
END;
*/