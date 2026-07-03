CREATE OR REPLACE FUNCTION fechar_conta()
RETURNS TRIGGER AS $$
DECLARE
    valorTotal NUMERIC(10,2);
    valorPago NUMERIC(10,2);
BEGIN

  -- Soma dos pagamentos da conta
    SELECT SUM(valor_pago)
    INTO valorPago
    FROM Pagamentos
    WHERE conta = NEW.conta;

    IF valorPago IS NULL THEN
        valorPago := 0;
    END IF;
  
  -- Pega valor total da conta
    SELECT valor_total
    INTO valorTotal
    FROM Contas
    WHERE id = NEW.conta;

  -- Conta totalmente paga
    IF valorPago >= valorTotal THEN
        UPDATE Contas
        SET status = 'Paga'
        WHERE id = NEW.conta;

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fecharConta
AFTER INSERT ON Pagamentos
FOR EACH ROW
EXECUTE FUNCTION fechar_conta();
