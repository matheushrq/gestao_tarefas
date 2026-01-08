CREATE PROCEDURE AtualizarStatusTarefa
    @TarefaID INT,
    @NovoStatusID INT
AS
BEGIN
    UPDATE  Tarefas
    SET     StatusID = @NovoStatusID
    WHERE   TarefaID = @TarefaID;
END;