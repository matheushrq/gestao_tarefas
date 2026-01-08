CREATE PROCEDURE DeleteTask
    @TaskId INT
AS
BEGIN
    DELETE FROM Tarefas
    WHERE TarefaID = @TaskId
END
GO