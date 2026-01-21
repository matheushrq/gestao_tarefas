IF OBJECT_ID('dbo.sp_adicionar_nova_tarefa', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_adicionar_nova_tarefa;
GO

CREATE PROCEDURE dbo.sp_adicionar_nova_tarefa
    @titulo         NVARCHAR(100),
    @Descricao      NVARCHAR(255),
    @DataCriacao    DATETIME,
    @DataPrazo      DATETIME,
    @StatusID       INT,
    @UsuarioID      INT
AS
BEGIN
    begin try
        INSERT INTO Tarefas (Titulo, Descricao, DataCriacao, DataPrazo, StatusID, UsuarioID)
        VALUES (@titulo, @Descricao, @DataCriacao, @DataPrazo, @StatusID, @UsuarioID)

        if (@DataPrazo < @DataCriacao)
        BEGIN
            RAISERROR('A data de prazo não pode ser anterior a data de criação.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
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