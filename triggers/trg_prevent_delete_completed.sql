-- Trigger para impedir exclusão de tarefas concluídas
CREATE TRIGGER trg_prevent_delete_completed
ON tarefas
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE status = 'concluída')
    BEGIN
        RAISERROR ('Não é permitido excluir tarefas concluídas.', 16, 1);
        RETURN;
    END
    DELETE FROM tarefas WHERE id_tarefa IN (SELECT id_tarefa FROM deleted WHERE status <> 'concluída');
END;
