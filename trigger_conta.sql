-- Gerar Conta pós finalização do pedido
CREATE OR REPLACE FUNCTION gerar_conta()
RETURNS TRIGGER AS $$
DECLARE
    valorPedido NUMERIC(10,2);
    taxa NUMERIC(10,2);
    valorTotal NUMERIC(10,2);
BEGIN

    IF OLD.status <> 'Finalizado'
       AND NEW.status = 'Finalizado' THEN
  
        -- Soma o valor de todos os itens do pedido
        SELECT SUM(i.preco * ip.quantidade)
        INTO valorPedido
        FROM ItensPedido ip
        JOIN Itens i
            ON ip.item = i.id
        WHERE ip.pedido = NEW.id;

        -- Caso o pedido não possua itens
        IF valorPedido IS NULL THEN
            valorPedido := 0;
        END IF;

        -- Calcula 10% de serviço
        taxa := valorPedido * 0.10;

        -- Calcula o total
        valorTotal := valorPedido + taxa;

        -- Cria a conta
        INSERT INTO Contas(
            pedido,
            valor_total,
            valor_pedido,
            taxa_servico
        )
        VALUES(
            NEW.id,
            valorTotal,
            valorPedido,
            taxa
        );
        UPDATE Garcons
        SET comissao = comissao + taxa
        WHERE codga = NEW.garcom;

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER gerarConta
AFTER UPDATE OF status ON Pedidos
FOR EACH ROW
EXECUTE FUNCTION gerar_conta();
