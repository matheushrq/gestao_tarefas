CREATE OR ALTER PROCEDURE sp_atualizar_status_tarefa
    @TarefaID       INT,
    @NovoStatusID   INT
AS
BEGIN
    begin try
        UPDATE  Tarefas
        SET     StatusID = @NovoStatusID
        WHERE   TarefaID = @TarefaID;
    end try
    begin catch
        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorSeverity  INT;
        DECLARE @ErrorState     INT;

        SELECT 
            @ErrorMessage   = ERROR_MESSAGE(),
            @ErrorSeverity  = ERROR_SEVERITY(),
            @ErrorState     = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    end catch
END;