CREATE OR ALTER PROCEDURE dbo.sp_exclui_tarefa
    @TarefaId INT
AS
BEGIN
    begin try
        DELETE FROM Tarefas
        WHERE TarefaID = @TarefaId
    end try
    begin catch
        -- tratamento de erros

        DECLARE @ErrorMessage   NVARCHAR(4000);
        DECLARE @ErrorSeverity  INT;
        DECLARE @ErrorState     INT;

        SELECT
            @ErrorMessage   = ERROR_MESSAGE(),
            @ErrorSeverity  = ERROR_SEVERITY(),
            @ErrorState     = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    end catch
END
GO