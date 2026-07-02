# RestauranteBD
Projeto produzido como trabalho final da matéria de **Banco de dados I**.
O projeto consiste na estruturação de um Dominio, modelagem conceitual, lógica e fisica de um banco de dados para um restaurante, buscando atender todas as dinamicas do estabelecimento.

## Dominio
O dominio do restaurante dá um norte de como modelar o banco da forma que queremos que ele funcione.

- Domínio do Restaurante
O salão do restaurante possui várias mesas. Cada mesa tem um número identificador
único, sua capacidade máxima de lugares e um status (Disponível, Ocupada ou
Reservada). Uma mesa pode possuir várias reservas ao longo do tempo, porém não
pode possuir reservas conflitantes para a mesma data e horário.
Para clientes que realizam reservas, o sistema deve armazenar o nome, CPF, telefone
de contato e e-mail. Um cliente pode reservar uma mesa para uma data e horário
específicos. Além disso, cada reserva possui um número identificador, quantidade de
pessoas e um status (Ativa, Cancelada ou Concluída).
O restaurante possui colaboradores divididos nos cargos de Garçom, Cozinheiro e
Gerente. De cada colaborador, o sistema deve registrar CPF, nome completo, email,
data de admissão e salário. Os garçons possuem registrada a comissão total obtida
pelos atendimentos realizados. Os cozinheiros possuem registrada sua especialidade
culinária. Os gerentes são responsáveis por um setor do restaurante e supervisionam
outros colaboradores.
O cardápio é organizado em categorias. Cada categoria possui um identificador e um
nome. Cada item do cardápio possui um nome único, uma descrição, o preço de venda
e pertence a uma única categoria.
Quando uma mesa realiza um pedido, é gerado um registro associado à mesa e ao
garçom responsável pelo atendimento. Cada pedido possui um número identificador, a
data e hora de abertura e um status (Aberta, Em Preparação, Finalizado ou Cancelado).
Um pedido pode conter vários itens do cardápio, assim como um mesmo item pode
estar presente em diversos pedidos. Para cada item solicitado em um pedido, devem
ser registrados a quantidade e eventuais observações (por exemplo, "sem cebola").
Ao encerrar o atendimento, o pedido gera uma conta. Cada pedido gera exatamente
uma conta, e cada conta está associada a um único pedido. O sistema deve registrar o
número da conta, o valor do pedido, o valor da taxa de serviço (10%), o valor total da
conta e o status da conta (Aberta ou Paga).
Para cada pagamento realizado, deve-se registrar a forma de pagamento utilizada.
Também, cada pagamento possui um identificador, o valor pago, data e hora. Se aconta for dividida, o sistema deve permitir múltiplos registros de pagamento para a
mesma conta.

## Modelagem conceitual (ER)
A modelagem ER do banco nos permite começar a entender como sera a estrutura do banco, definindo as entidades, seus atributos e como elas vão se relacionar.
No projeto, podemos ver algumas conceitos da modelagem ER, como:
  - Especificações de colaboradores
  - A entidade associativa Pedidos
    - que faz a relação entre cliente e garçom, mas faz relacionamento com Conta, na geração, e ItensPedido, que fazem parte daquele pedido.
<img width="1245" height="833" alt="image" src="https://github.com/user-attachments/assets/4af9fc50-6698-4530-bdfa-43cd30bb8cc1" />
