-- ============================================
-- DELETE - Exclusões SQL
-- ============================================

-- 1. Excluir pagamentos recusados de pedidos específicos (preservando histórico de aprovados)
DELETE FROM Pagamento
WHERE status = 'recusado' 
  AND id_pedido = 5;

-- 2. Excluir itens de pedido antes de excluir o pedido (respeitando integridade referencial)
-- Primeiro: remover os itens do pedido
DELETE FROM ItemPedido
WHERE id_pedido = 5 
  AND id_pedido IN (
      SELECT id_pedido FROM Pedido WHERE id_usuario = 4
  );

-- 3. Excluir ingressos não vinculados a nenhum pedido (limpeza de dados órfãos)
DELETE FROM Ingresso
WHERE id_pedido IS NULL 
  AND id_ingresso NOT IN (
      SELECT id_ingresso FROM ItemPedido
  );
