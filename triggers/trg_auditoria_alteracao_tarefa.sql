-- Explicação: Sempre que uma tarefa for atualizada, registra o ID, data/hora e usuário responsável na tabela TaskAuditLog.
CREATE TRIGGER trg_TaskUpdateAudit
ON  Tarefas
AFTER UPDATE
AS
BEGIN
    INSERT INTO TaskAuditLog (TaskId, ChangedAt, ChangedBy)
    SELECT i.TarefaID, GETDATE(), i.UsuarioID
    FROM inserted i
END
GO