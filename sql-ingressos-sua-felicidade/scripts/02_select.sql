-- ============================================
-- SELECT - Consultas SQL
-- ============================================

-- 1. Listar eventos disponíveis ordenados por data e com um limite de 10 retornos (usando ORDER BY e LIMIT)
SELECT 
    id_evento,
    nome,
    data,
    local
FROM Evento
ORDER BY data ASC
LIMIT 10;

-- 2. Consultar pedidos por usuário com detalhes (usando JOIN e WHERE)
SELECT 
    u.nome AS nome_usuario,
    u.email,
    p.id_pedido,
    p.data_pedido,
    p.total,
    COUNT(ip.id_ingresso) AS quantidade_ingressos
FROM Usuario u
INNER JOIN Pedido p ON u.id_usuario = p. id_usuario
INNER JOIN ItemPedido ip ON p. id_pedido = ip.id_pedido
WHERE u. id_usuario = 1
GROUP BY u.nome, u.email, p.id_pedido, p.data_pedido, p.total
ORDER BY p.data_pedido DESC;

-- 3. Verificar pagamentos aprovados com informações do pedido e usuário com um limite de 5 retornos (usando JOIN, WHERE, ORDER BY e LIMIT)
SELECT 
    pg.id_pagamento,
    u.nome AS cliente,
    p.id_pedido,
    pg.data_pagamento,
    pg. valor,
    pg.status
FROM Pagamento pg
INNER JOIN Pedido p ON pg.id_pedido = p.id_pedido
INNER JOIN Usuario u ON p.id_usuario = u. id_usuario
WHERE pg.status = 'aprovado'
ORDER BY pg.data_pagamento DESC
LIMIT 5;
