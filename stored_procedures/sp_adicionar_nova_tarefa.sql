CREATE PROCEDURE AddTask
    @UserId INT,
    @Title NVARCHAR(100),
    @Description NVARCHAR(255),
    @DueDate DATE,
    @Status NVARCHAR(20)
AS
BEGIN
    INSERT INTO Tarefas (UsuarioID, Titulo, Descricao, DataPrazo, StatusID)
    VALUES (@UserId, @Title, @Description, @DueDate, @Status)
END
GO