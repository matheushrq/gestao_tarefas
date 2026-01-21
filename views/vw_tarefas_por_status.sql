if object_id('vw_tarefas_por_status', 'V') is not null
begin
    drop view vw_tarefas_por_status;
end
go

-- View para mostrar quantidade de tarefas por status

CREATE  VIEW vw_tarefas_por_status AS
SELECT  StatusID, 
        COUNT(*) AS quantidade
FROM    tarefas
GROUP   BY StatusID;