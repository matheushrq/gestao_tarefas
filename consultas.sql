IF OBJECT_ID('tempdb..#TempUsuarios') IS NOT NULL
begin
    DROP TABLE #TempUsuarios;
end

CREATE TABLE #TempUsuarios
(
    Nome NVARCHAR(100),
    Email NVARCHAR(100)
);

bulk insert #TempUsuarios
from 'C:\Git\projeto\task_management\lista.csv'
with
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

INSERT INTO Usuarios (Nome, Email)
SELECT Nome, Email FROM #TempUsuarios;

DROP TABLE #TempUsuarios;

SELECT * FROM Usuarios

SELECT  * from Tarefas

select  * from [Status]

exec sp_adicionar_nova_tarefa
    @titulo = 'Finalizar Relatório Anual',
    @Descricao = 'Compilar todos os dados financeiros e preparar o relatório anual para a diretoria.',
    @DataPrazo = '2026-12-31',
    @StatusID = 1,
    @UserId = 1;