CREATE OR ALTER PROCEDURE sp_lista_tarefas_usuario
    @UsuarioID INT
AS
BEGIN
    begin try
        SELECT
            TarefaID,
            Titulo,
            Descricao,
            DataCriacao,
            DataPrazo,
            StatusID
        FROM    Tarefas
        WHERE   UsuarioID = @UsuarioID
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
END
GO