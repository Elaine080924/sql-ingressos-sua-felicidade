DELETE FROM Pagamento
WHERE status_pagamento = 'negado';

DELETE FROM Pedido
WHERE status_pedido = 'cancelado';

DELETE FROM Ingresso
WHERE disponibilidade = 0;
