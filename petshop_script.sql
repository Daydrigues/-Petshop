
-- Tabela: departamento
CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO departamento (id_departamento, nome) VALUES
(1, 'Veterinária'),
(2, 'Banho e Tosa'),
(3, 'Vendas');

-- Tabela: empregado
CREATE TABLE empregado (
    id_empregado INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_admissao DATE,
    salario DECIMAL(10,2),
    comissao DECIMAL(10,2),
    telefone VARCHAR(15),
    sexo CHAR(1),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

INSERT INTO empregado (id_empregado, nome, cpf, data_admissao, salario, comissao, telefone, sexo, id_departamento) VALUES
(1, 'Carlos Silva', '123.456.789-00', '2020-02-15', 3000.00, 500.00, '81999990000', 'M', 1),
(2, 'Maria Souza', '987.654.321-00', '2021-05-10', 2800.00, 400.00, '81999990001', 'F', 2),
(3, 'João Lima', '456.789.123-00', '2023-01-05', 2500.00, 300.00, '81999990002', 'M', 3);

-- Tabela: cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15)
);

INSERT INTO cliente (id_cliente, nome, telefone) VALUES
(1, 'Ana Paula', '81999991111'),
(2, 'Bruno Castro', '81999992222'),
(3, 'Clara Nunes', '81999993333');

-- Tabela: pet
CREATE TABLE pet (
    id_pet INT PRIMARY KEY,
    nome VARCHAR(100),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO pet (id_pet, nome, id_cliente) VALUES
(1, 'Bidu', 1),
(2, 'Rex', 2),
(3, 'Luna', 3);

-- Tabela: servico
CREATE TABLE servico (
    id_servico INT PRIMARY KEY,
    nome VARCHAR(100),
    valor DECIMAL(10,2)
);

INSERT INTO servico (id_servico, nome, valor) VALUES
(1, 'Banho', 50.00),
(2, 'Tosa', 60.00),
(3, 'Consulta', 120.00);

-- Tabela: forma_pagamento
CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY,
    tipo VARCHAR(50)
);

INSERT INTO forma_pagamento (id_forma_pagamento, tipo) VALUES
(1, 'Cartão'),
(2, 'Dinheiro'),
(3, 'PIX');

-- Tabela: venda
CREATE TABLE venda (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_pet INT,
    id_empregado INT,
    id_forma_pagamento INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    desconto DECIMAL(10,2),
    valor_final DECIMAL(10,2),
    comissao DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (id_empregado) REFERENCES empregado(id_empregado),
    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

INSERT INTO venda (id_venda, id_cliente, id_pet, id_empregado, id_forma_pagamento, data_venda, valor_total, desconto, valor_final, comissao) VALUES
(1, 1, 1, 1, 1, '2023-05-01', 200.00, 10.00, 190.00, 20.00),
(2, 2, 2, 2, 2, '2023-06-15', 120.00, 0.00, 120.00, 12.00),
(3, 3, 3, 3, 3, '2023-07-10', 180.00, 20.00, 160.00, 16.00);

-- Tabela: servico_venda
CREATE TABLE servico_venda (
    id_servico_venda INT PRIMARY KEY,
    id_venda INT,
    id_servico INT,
    data_servico DATE,
    quantidade INT,
    valor DECIMAL(10,2),
    comissao DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

INSERT INTO servico_venda (id_servico_venda, id_venda, id_servico, data_servico, quantidade, valor, comissao) VALUES
(1, 1, 1, '2023-05-01', 1, 50.00, 5.00),
(2, 2, 2, '2023-06-15', 2, 60.00, 6.00),
(3, 3, 3, '2023-07-10', 1, 120.00, 12.00);

-- Tabela: fornecedor
CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

INSERT INTO fornecedor (id_fornecedor, nome, email, telefone) VALUES
(1, 'PetFornecedor A', 'contato@peta.com', '81988887777'),
(2, 'PetFornecedor B', 'contato@petb.com', '81988886666'),
(3, 'PetFornecedor C', 'contato@petc.com', '81988885555');

-- Tabela: produto
CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    valor DECIMAL(10,2),
    categoria VARCHAR(100),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

INSERT INTO produto (id_produto, nome, valor, categoria, id_fornecedor) VALUES
(1, 'Ração Premium', 150.00, 'Alimentação', 1),
(2, 'Coleira Antipulga', 80.00, 'Acessórios', 2),
(3, 'Shampoo Pet', 30.00, 'Higiene', 3);

-- Tabela: venda_produto
CREATE TABLE venda_produto (
    id_venda_produto INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO venda_produto (id_venda_produto, id_venda, id_produto, quantidade, valor) VALUES
(1, 1, 1, 1, 150.00),
(2, 2, 2, 2, 160.00),
(3, 3, 3, 1, 30.00);
