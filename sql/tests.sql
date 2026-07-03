-- Reservas
INSERT INTO Mesas(numero,qnt_lugares)
VALUES (1,4);

INSERT INTO Clientes
VALUES(
111,
'Thiago',
'123',
'teste@email.com'
);

INSERT INTO Reservas(
mesa,
cliente,
data,
horario,
qnt_pessoas
)
VALUES(
1,
111,
CURRENT_DATE,
'19:00',
4
);

SELECT * FROM Mesas;

  -- conclui reserva
UPDATE Reservas
SET status='Concluida'
WHERE id=1;

SELECT * FROM Mesas;

  -- cancela reserva
UPDATE Reservas
SET status='Cancelada'
WHERE id=1;

SELECT * FROM Mesas;

-- Gerar conta
INSERT INTO Gerentes
VALUES(1,'Salao');

INSERT INTO Colaboradores
VALUES(
1,
12345678901,
'Carlos',
2500,
CURRENT_DATE,
1
);

INSERT INTO Garcons
VALUES(
1,
0
);

INSERT INTO Cardapio
VALUES(
1,
'Pratos'
);

INSERT INTO Itens
VALUES(
1,
1,
'Hamburguer',
50,
'Hamburguer'
);

-- criar pedido
INSERT INTO Pedidos(
mesa,
garcom,
data
)
VALUES(
1,
1,
CURRENT_TIMESTAMP
);

-- itens ao pedido
INSERT INTO ItensPedido
VALUES(
1,
1,
2
);

-- finalizar
UPDATE Pedidos
SET status='Finalizado'
WHERE id=1;

SELECT * FROM Contas;

SELECT * FROM Garcons;

-- fechar conta
INSERT INTO Pagamentos(
conta,
valor_pago,
forma,
data,
hora
)
VALUES(
1,
110,
'PIX',
CURRENT_DATE,
CURRENT_TIME
);

SELECT * FROM Contas;
