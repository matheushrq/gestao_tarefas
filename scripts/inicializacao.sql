-- Script para popular o banco com dados de exemplo
INSERT INTO usuarios (id_usuario, nome) VALUES (1, 'Matheus'), (2, 'João');
INSERT INTO tarefas (id_tarefa, titulo, status, id_usuario) VALUES
(1, 'Estudar SQL', 'pendente', 1),
(2, 'Criar trigger', 'em andamento', 2),
(3, 'Testar procedures', 'concluída', 1);
