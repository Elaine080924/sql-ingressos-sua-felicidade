UPDATE Evento
SET preco_base = 90.00
WHERE id_evento = 1;

UPDATE Pedido
SET status_pedido = 'pago'
WHERE id_pedido = 2;

UPDATE Ingresso
SET disponibilidade = disponibilidade - 5
WHERE id_ingresso = 1;
