if object_id('vw_TarefasAtrasadas', 'V') is not null
begin
    drop view vw_TarefasAtrasadas;
end
go

CREATE  VIEW vw_TarefasAtrasadas AS
SELECT  T.TarefaID, T.Titulo, T.DataPrazo, U.Nome AS Responsavel
FROM    Tarefas T
INNER   JOIN Usuarios U
ON      T.UsuarioID = U.UsuarioID
WHERE   T.DataPrazo < GETDATE() 
AND     T.StatusID <> 3;