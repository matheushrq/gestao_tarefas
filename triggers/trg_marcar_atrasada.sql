CREATE TRIGGER trg_MarcarAtrasada
ON Tarefas
AFTER UPDATE
AS
BEGIN
    UPDATE Tarefas
    SET StatusID = 4 -- Atrasada
    WHERE DataPrazo < GETDATE() AND StatusID <> 3;
END;
