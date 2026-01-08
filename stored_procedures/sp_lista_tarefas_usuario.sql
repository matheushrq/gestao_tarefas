CREATE PROCEDURE GetTasksByUser
    @UserId INT
AS
BEGIN
    SELECT TarefaID, Titulo, Descricao, DataPrazo, StatusID
    FROM Tarefas
    WHERE UsuarioID = @UserId
END
GO