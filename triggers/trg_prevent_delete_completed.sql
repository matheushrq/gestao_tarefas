-- Trigger para impedir exclusão de tarefas concluídas
CREATE  TRIGGER trg_prevent_delete_completed
ON      Tarefas
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE StatusID = 3)
    BEGIN
        RAISERROR ('Não é permitido excluir tarefas concluídas.', 16, 1);
        RETURN;
    END
    DELETE FROM tarefas WHERE TarefaID IN (SELECT TarefaID FROM deleted WHERE StatusID <> 3);
END;