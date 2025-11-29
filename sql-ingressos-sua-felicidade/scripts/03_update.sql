-- ============================================
-- UPDATE - Atualizações SQL
-- ============================================

-- 1. Atualizar status do pagamento para 'aprovado' apenas para pagamentos pendentes de um pedido específico
UPDATE Pagamento
SET status = 'aprovado',
    data_pagamento = CURRENT_DATE
WHERE id_pedido = 3 
  AND status = 'pendente';

-- 2. Atualizar o email de um usuário específico (com verificação de existência)
UPDATE Usuario
SET email = 'joao.silva. novo@email.com'
WHERE id_usuario = 1 
  AND email = 'joao. silva@email.com';

-- 3. Atualizar o local de um evento futuro (evitando alterar eventos passados)
UPDATE Evento
SET local = 'Estádio do Maracanã - Rio de Janeiro'
WHERE id_evento = 1 
  AND data > CURRENT_DATE;
