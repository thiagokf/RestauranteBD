CREATE TABLE IF NOT EXISTS Clientes (
    cpf INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Mesas (
    numero INT PRIMARY KEY,
    qnt_lugares INT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Disponivel'
        CHECK (status IN ('Disponivel','Ocupada','Reservada'))
);

CREATE TABLE IF NOT EXISTS Gerentes (
    codge INT PRIMARY KEY,
    setor VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Colaboradores (
    codf INT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    salario NUMERIC(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    Gerente INT,
    FOREIGN KEY (Gerente) REFERENCES Gerentes(codge)
);

CREATE TABLE IF NOT EXISTS Garcons (
    codga INT PRIMARY KEY,
    comissao FLOAT,
    FOREIGN KEY (codga) REFERENCES Colaboradores(codf)
);

CREATE TABLE IF NOT EXISTS Culinarias (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cozinheiros (
    codf INT PRIMARY KEY,
    especialidade INT NOT NULL,
    FOREIGN KEY (codf) REFERENCES Colaboradores(codf),
    FOREIGN KEY (especialidade) REFERENCES Culinarias(id)
);

CREATE TABLE IF NOT EXISTS Cardapio (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Itens (
    id INT PRIMARY KEY,
    cardapio INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,
    descricao VARCHAR(255) NOT NULL,

    FOREIGN KEY (cardapio) REFERENCES Cardapio(id)
);

CREATE TABLE IF NOT EXISTS Pedidos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mesa INT NOT NULL,
    garcom INT NOT NULL,
    data TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Aberto'
        CHECK (status IN ('Aberto','Em Preparacao','Finalizado','Cancelado')),
    FOREIGN KEY (mesa) REFERENCES Mesas(numero),
    FOREIGN KEY (garcom) REFERENCES Garcons(codga)
);

CREATE TABLE IF NOT EXISTS Contas (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pedido INT NOT NULL UNIQUE,
    valor_total NUMERIC(10,2) NOT NULL,
    valor_pedido NUMERIC(10,2) NOT NULL,
    taxa_servico NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Aberta'
        CHECK (status IN ('Aberta', 'Paga')),
    FOREIGN KEY (pedido) REFERENCES Pedidos(id)
);

CREATE TABLE IF NOT EXISTS Pagamentos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    conta INT NOT NULL,
    valor_pago NUMERIC(10,2) NOT NULL,
    forma VARCHAR(20) NOT NULL
        CHECK (forma IN ('Dinheiro','Credito','Debito','PIX')),
    data DATE NOT NULL,
    hora TIME NOT NULL,
    FOREIGN KEY (conta) REFERENCES Contas(id)
);

CREATE TABLE IF NOT EXISTS Reservas (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mesa INT NOT NULL,
    cliente INT NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    qnt_pessoas INT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativa'
        CHECK (status IN ('Ativa','Cancelada','Concluida')),

    UNIQUE (mesa, data, horario),

    FOREIGN KEY (mesa) REFERENCES Mesas(numero),
    FOREIGN KEY (cliente) REFERENCES Clientes(cpf)
);

CREATE TABLE IF NOT EXISTS ItensPedido (
    pedido INT NOT NULL,
    item INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido, item),
    FOREIGN KEY (pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (item) REFERENCES Itens(id)
);
