-- Fazer reserva
CREATE OR REPLACE FUNCTION fazer_reserva()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Mesas
    SET status = 'Reservada'
    WHERE numero = NEW.mesa;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fazerReserva
AFTER INSERT ON Reservas
FOR EACH ROW
EXECUTE FUNCTION fazer_reserva();

-- Concluir Reserva
CREATE OR REPLACE FUNCTION concluir_reserva()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status <> 'Concluida'
      AND NEW.status = 'Concluida' THEN
        UPDATE Mesas
        SET status = 'Ocupada'
        WHERE numero = NEW.mesa;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER concluirReserva
AFTER UPDATE OF status ON Reservas
FOR EACH ROW
EXECUTE FUNCTION concluir_reserva();

-- Cancelar Reserva
CREATE OR REPLACE FUNCTION cancelar_reserva()
RETURNS TRIGGER AS $$
BEGIN
  IF OLD.status <> 'Cancelada'
   AND NEW.status = 'Cancelada' THEN
    UPDATE Mesas
    SET status = 'Disponivel'
    WHERE numero = NEW.mesa;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cancelarReserva
AFTER UPDATE of status ON Reservas
FOR EACH ROW
EXECUTE FUNCTION cancelar_reserva();

