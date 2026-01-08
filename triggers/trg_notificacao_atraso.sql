-- Explicação: Quando o status de uma tarefa é atualizado e a data limite já passou, marca o campo IsLate como TRUE.
CREATE TRIGGER trg_TaskLateNotification
ON Tarefas
AFTER UPDATE
AS
BEGIN
    UPDATE t
    SET IsLate = 1
    FROM Tarefas t
    INNER JOIN inserted i ON t.TarefaID = i.TarefaID
    WHERE i.DataPrazo < GETDATE() AND i.StatusID <> 3
END
GO