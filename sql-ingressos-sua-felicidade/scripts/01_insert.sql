INSERT INTO Usuario (nome, email, senha, telefone) VALUES
('Ana Oliveira', 'ana@email.com', '123', '11999990001'),
('Carlos Lima', 'carlos@email.com', '123', '11999990002');

INSERT INTO Evento (nome_evento, descricao, data_evento, local, categoria, capacidade_total, preco_base) VALUES
('Show Rock Night', 'Show de rock nacional', '2025-08-12', 'Arena Central', 'Show', 500, 80.00),
('Peça Teatral Vida', 'Drama teatral', '2025-09-05', 'Teatro Municipal', 'Teatro', 200, 50.00);

INSERT INTO Ingresso (tipo_ingresso, preco, lote, disponibilidade, id_evento) VALUES
('Inteira', 80.00, 1, 200, 1),
('Meia', 40.00, 1, 150, 1),
('VIP', 150.00, 1, 50, 1),
('Inteira', 50.00, 1, 100, 2),
('Meia', 25.00, 1, 100, 2);

INSERT INTO Pedido (data_pedido, valor_total, status_pedido, id_usuario) VALUES
('2025-07-01', 160.00, 'pago', 1),
('2025-07-02', 50.00, 'pendente', 2);

INSERT INTO ItemPedido (quantidade, valor_unitario, id_pedido, id_ingresso) VALUES
(2, 80.00, 1, 1),
(1, 50.00, 2, 4);

INSERT INTO Pagamento (data_pagamento, forma_pagamento, status_pagamento, id_pedido) VALUES
('2025-07-01', 'Pix', 'aprovado', 1),
(NULL, 'Boleto', 'aguardando', 2);
