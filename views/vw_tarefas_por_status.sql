-- View para mostrar quantidade de tarefas por status
CREATE VIEW vw_tarefas_por_status AS
SELECT status, COUNT(*) AS quantidade
FROM tarefas
GROUP BY status;
