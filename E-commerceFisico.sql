/* E-commerceLogico2: */

CREATE TABLE Estoque  (
    id_estoque INT PRIMARY KEY,
    quantidade_disponivel INT,
    localizacao VARCHAR
);

CREATE TABLE Historico_estoque (
    id_historico_estoque INT PRIMARY KEY,
    data_modificacao DATE,
    tipo_movimentacao VARCHAR,
    quantidade_movimentada INT
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    forma_pagamento VARCHAR,
    status VARCHAR,
    valor_pago DOUBLE
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    telefone VARCHAR,
    fk_endereco_endereco_PK INT
);

CREATE TABLE Produto_Iten_pedido (
    id_produto INT,
    nome_produto VARCHAR,
    descricao_produto VARCHAR,
    preco DOUBLE,
    categoria VARCHAR,
    url_imagem BLOB,
    id_item_pedido INT,
    quantidade INT,
    preco_unitario DOUBLE,
    fk_Pedido_id_pedido INT,
    fk_Estoque _id_estoque INT,
    PRIMARY KEY (id_produto, id_item_pedido)
);

CREATE TABLE Avaliacao_do_produto (
    id_avaliacao INT PRIMARY KEY,
    nota INT,
    comentario VARCHAR,
    data_avaliacao DATE,
    fk_Produto_Iten_pedido_id_produto INT,
    fk_Produto_Iten_pedido_id_item_pedido INT
);

CREATE TABLE Campanhas_de_marketing (
    id_campanha INT PRIMARY KEY,
    nome_campanha VARCHAR,
    data_inicio DATE,
    data_fim DATE,
    orcamento DOUBLE,
    publico_alvo VARCHAR
);

CREATE TABLE Historico_pedido_Pedido (
    id_historico_pedido INT,
    data_historico DATE,
    descricao_status VARCHAR,
    id_pedido INT,
    data_pedido DATE,
    status_pedido VARCHAR,
    fk_Cliente_id_cliente INT,
    fk_Devolucao_id_devolucao INT,
    PRIMARY KEY (id_historico_pedido, id_pedido)
);

CREATE TABLE Administrador (
    id_administrador INT PRIMARY KEY,
    nome_usuario VARCHAR,
    senha_seguranca VARCHAR,
    email VARCHAR,
    nivel_acesso VARCHAR,
    fk_Historico_estoque_id_historico_estoque INT
);

CREATE TABLE Devolucao (
    id_devolucao INT PRIMARY KEY,
    data_devolucao DATE,
    motivo_devolucao VARCHAR,
    status_devolucao VARCHAR
);

CREATE TABLE Cupom (
    id_cupom INT PRIMARY KEY,
    codigo_cupom VARCHAR,
    valor_desconto DOUBLE,
    data_inicio_validade DATE,
    data_fim_validade DATE,
    fk_Pedido_id_pedido INT,
    fk_Campanhas_de_marketing_id_campanha INT
);

CREATE TABLE endereco (
    endereco_PK INT NOT NULL,
    id_endereco INT,
    CEP VARCHAR,
    numero VARCHAR,
    pais VARCHAR,
    rua VARCHAR,
    bairro VARCHAR,
    PRIMARY KEY (endereco_PK, id_endereco)
);

CREATE TABLE Realiza (
    fk_Cliente_id_cliente INT,
    fk_Avaliacao_do_produto_id_avaliacao INT
);

CREATE TABLE Atualiza (
    fk_Historico_estoque_id_historico_estoque INT,
    fk_Produto_Iten_pedido_id_produto INT,
    fk_Produto_Iten_pedido_id_item_pedido INT
);

CREATE TABLE Efetua (
    fk_Pedido_id_pedido INT,
    fk_Pagamento_id_pagamento INT
);

CREATE TABLE Administra (
    fk_Estoque _id_estoque INT,
    fk_Administrador_id_administrador INT
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_endereco_endereco_PK, ???)
    REFERENCES endereco (endereco_PK, ???)
    ON DELETE NO ACTION;
 
ALTER TABLE Produto_Iten_pedido ADD CONSTRAINT FK_Produto_Iten_pedido_2
    FOREIGN KEY (fk_Pedido_id_pedido)
    REFERENCES ??? (???);
 
ALTER TABLE Produto_Iten_pedido ADD CONSTRAINT FK_Produto_Iten_pedido_3
    FOREIGN KEY (fk_Estoque _id_estoque)
    REFERENCES Estoque  (id_estoque)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacao_do_produto ADD CONSTRAINT FK_Avaliacao_do_produto_2
    FOREIGN KEY (fk_Produto_Iten_pedido_id_produto, fk_Produto_Iten_pedido_id_item_pedido)
    REFERENCES Produto_Iten_pedido (id_produto, id_item_pedido)
    ON DELETE CASCADE;
 
ALTER TABLE Historico_pedido_Pedido ADD CONSTRAINT FK_Historico_pedido_Pedido_2
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente);
 
ALTER TABLE Historico_pedido_Pedido ADD CONSTRAINT FK_Historico_pedido_Pedido_3
    FOREIGN KEY (fk_Devolucao_id_devolucao)
    REFERENCES Devolucao (id_devolucao);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (fk_Historico_estoque_id_historico_estoque)
    REFERENCES Historico_estoque (id_historico_estoque)
    ON DELETE RESTRICT;
 
ALTER TABLE Cupom ADD CONSTRAINT FK_Cupom_2
    FOREIGN KEY (fk_Pedido_id_pedido)
    REFERENCES ??? (???);
 
ALTER TABLE Cupom ADD CONSTRAINT FK_Cupom_3
    FOREIGN KEY (fk_Campanhas_de_marketing_id_campanha)
    REFERENCES Campanhas_de_marketing (id_campanha)
    ON DELETE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (fk_Cliente_id_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (fk_Avaliacao_do_produto_id_avaliacao)
    REFERENCES Avaliacao_do_produto (id_avaliacao)
    ON DELETE SET NULL;
 
ALTER TABLE Atualiza ADD CONSTRAINT FK_Atualiza_1
    FOREIGN KEY (fk_Historico_estoque_id_historico_estoque)
    REFERENCES Historico_estoque (id_historico_estoque)
    ON DELETE RESTRICT;
 
ALTER TABLE Atualiza ADD CONSTRAINT FK_Atualiza_2
    FOREIGN KEY (fk_Produto_Iten_pedido_id_produto, fk_Produto_Iten_pedido_id_item_pedido)
    REFERENCES Produto_Iten_pedido (id_produto, id_item_pedido)
    ON DELETE SET NULL;
 
ALTER TABLE Efetua ADD CONSTRAINT FK_Efetua_1
    FOREIGN KEY (fk_Pedido_id_pedido)
    REFERENCES ??? (???);
 
ALTER TABLE Efetua ADD CONSTRAINT FK_Efetua_2
    FOREIGN KEY (fk_Pagamento_id_pagamento)
    REFERENCES Pagamento (id_pagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Administra ADD CONSTRAINT FK_Administra_1
    FOREIGN KEY (fk_Estoque _id_estoque)
    REFERENCES Estoque  (id_estoque)
    ON DELETE RESTRICT;
 
ALTER TABLE Administra ADD CONSTRAINT FK_Administra_2
    FOREIGN KEY (fk_Administrador_id_administrador)
    REFERENCES Administrador (id_administrador)
    ON DELETE RESTRICT;
