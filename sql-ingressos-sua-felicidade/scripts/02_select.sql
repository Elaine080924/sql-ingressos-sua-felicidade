-- 1) Listar eventos por data
SELECT nome_evento, data_evento, categoria
FROM Evento
ORDER BY data_evento;

-- 2) Pedidos com usuários
SELECT u.nome, p.id_pedido, p.valor_total
FROM Pedido p
JOIN Usuario u ON p.id_usuario = u.id_usuario;

-- 3) Ingressos por evento
SELECT e.nome_evento, i.tipo_ingresso, i.preco
FROM Ingresso i
JOIN Evento e ON i.id_evento = e.id_evento;

-- 4) Pedidos pagos
SELECT * FROM Pedido
WHERE status_pedido = 'pago';

-- 5) Limitar resultados
SELECT * FROM Evento
LIMIT 3;
