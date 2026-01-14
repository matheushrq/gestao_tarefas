CREATE OR ALTER PROCEDURE dbo.sp_adicionar_nova_tarefa
    @titulo         NVARCHAR(100),
    @Descricao      NVARCHAR(255),
    @DataPrazo      DATETIME,
    @StatusID       INT,
    @UsuarioID      INT
AS
BEGIN
    begin try
        INSERT INTO Tarefas (Titulo, Descricao, DataCriacao, DataPrazo, StatusID, UsuarioID)
        VALUES (@titulo, @Descricao, GETDATE(), @DataPrazo, @StatusID, @UsuarioID)
    end try
    begin catch
        -- tratamento de erros
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
    end catch
END
GO