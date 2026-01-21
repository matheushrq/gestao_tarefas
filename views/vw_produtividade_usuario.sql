CREATE VIEW vw_produtividade_usuario
AS
SELECT  U.Nome,
        COUNT(T.TarefaID) AS TotalTarefas, 
        SUM(CASE WHEN T.StatusID = 3 THEN 1 ELSE 0 END) AS TarefasConcluidas
FROM    Usuarios U
LEFT    JOIN Tarefas T
ON      U.UsuarioID = T.UsuarioID
GROUP   BY U.Nome;