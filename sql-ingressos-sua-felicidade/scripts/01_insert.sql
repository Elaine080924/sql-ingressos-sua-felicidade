-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela USUARIO
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Tabela EVENTO
CREATE TABLE Evento (
    id_evento SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    data DATE NOT NULL,
    local VARCHAR(200) NOT NULL
);

-- Tabela PEDIDO
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    data_pedido DATE NOT NULL DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Tabela INGRESSO
CREATE TABLE Ingresso (
    id_ingresso SERIAL PRIMARY KEY,
    id_evento INTEGER NOT NULL,
    id_pedido INTEGER,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Tabela ITEM_PEDIDO
CREATE TABLE ItemPedido (
    id_pedido INTEGER NOT NULL,
    id_ingresso INTEGER NOT NULL,
    PRIMARY KEY (id_pedido, id_ingresso),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_ingresso) REFERENCES Ingresso(id_ingresso)
);

-- Tabela PAGAMENTO
CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    data_pagamento DATE NOT NULL DEFAULT CURRENT_DATE,
    valor DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- ============================================
-- INSERT - Inclusão de Dados
-- ============================================

-- Inserindo Usuários
INSERT INTO Usuario (nome, email, senha) VALUES
('João Silva', 'joao. silva@email.com', 'senha123'),
('Maria Santos', 'maria.santos@email.com', 'senha456'),
('Pedro Oliveira', 'pedro.oliveira@email.com', 'senha789'),
('Ana Costa', 'ana.costa@email.com', 'senha101'),
('Carlos Ferreira', 'carlos.ferreira@email.com', 'senha202');

-- Inserindo Eventos
INSERT INTO Evento (nome, data, local) VALUES
('Rock in Rio 2025', '2025-09-15', 'Parque Olímpico - Rio de Janeiro'),
('Lollapalooza Brasil', '2025-03-28', 'Autódromo de Interlagos - São Paulo'),
('Festival de Jazz', '2025-07-10', 'Teatro Municipal - Belo Horizonte'),
('Show Coldplay', '2025-11-20', 'Allianz Parque - São Paulo'),
('Festa Junina Cultural', '2025-06-24', 'Centro de Convenções - Recife');

-- Inserindo Pedidos
INSERT INTO Pedido (id_usuario, data_pedido, total) VALUES
(1, '2025-01-15', 450.00),
(2, '2025-01-18', 300.00),
(3, '2025-02-01', 600.00),
(1, '2025-02-10', 150.00),
(4, '2025-02-15', 900.00);

-- Inserindo Ingressos
INSERT INTO Ingresso (id_evento, id_pedido, preco) VALUES
(1, 1, 225.00),
(1, 1, 225.00),
(2, 2, 300.00),
(3, 3, 200.00),
(3, 3, 200.00),
(3, 3, 200.00),
(4, 4, 150.00),
(4, 5, 300.00),
(4, 5, 300.00),
(4, 5, 300.00);

-- Inserindo Itens do Pedido
INSERT INTO ItemPedido (id_pedido, id_ingresso) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 7),
(5, 8),
(5, 9),
(5, 10);

-- Inserindo Pagamentos
INSERT INTO Pagamento (id_pedido, data_pagamento, valor, status) VALUES
(1, '2025-01-15', 450.00, 'aprovado'),
(2, '2025-01-18', 300.00, 'aprovado'),
(3, '2025-02-01', 600.00, 'pendente'),
(4, '2025-02-10', 150.00, 'aprovado'),
(5, '2025-02-15', 900.00, 'recusado');
