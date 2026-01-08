CREATE VIEW vw_TarefasAtrasadas AS
SELECT T.TarefaID, T.Titulo, T.DataPrazo, U.Nome AS Responsavel
FROM Tarefas T
INNER JOIN Usuarios U ON T.UsuarioID = U.UsuarioID
WHERE T.DataPrazo < GETDATE() AND T.StatusID <> 3;