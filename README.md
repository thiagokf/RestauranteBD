# Banco de dados para Restaurante
Projeto produzido como trabalho final da matéria de **Banco de dados I**. <br>
O projeto consiste na modelagem e implementação de um banco de dados para um restaurante, contemplando todas as etapas de desenvolvimento, desde a definição do domínio até a implementação física em PostgreSQL.

## Dominio
  O domínio do restaurante descreve as regras de negócio que serviram como base para o desenvolvimento das modelagens conceitual, lógica e física. <br>
Para melhor entendimento das modelagens do projeto, recomendo fazer a [leitura do dominio](https://github.com/thiagokf/RestauranteBD/blob/main/Dominio%20-%20Restaurante.pdf)

## Modelagem conceitual (ER)
  A modelagem ER do banco nos permite começar a entender como sera a estrutura do banco, definindo as entidades, seus atributos e como elas vão se relacionar.
No projeto, podemos ver algumas conceitos da modelagem ER, como:
  - Especificações de colaboradores
  - A entidade associativa Pedidos
    - que faz a relação entre mesa e garçom, mas faz relacionamento com Conta, na geração, e ItensPedido, que fazem parte daquele pedido.
<img width="1245" height="833" alt="image" src="https://github.com/user-attachments/assets/4af9fc50-6698-4530-bdfa-43cd30bb8cc1" />

## Modelagem Lógica
  A modelagem lógica nos dá uma melhor visão de como será a estrutura física do banco de dados. <br>
Algumas relações, vistas na modelagem conceitual, foram modeladas de formas diferentes. A relação de Responsável, por exemplo, foi representada apenas com a adição de um atributo de chave estrangeira (Gerente) na tabela de Colaboradores, pois mantem a lógica, a estrutura do banco e evita a implementação de mais uma tabela. As relações de Reserva, ItemPedido e Pedidos foram representadas por tabelas, já que seria a melhor forma de representação.
<img width="1365" height="656" alt="image" src="https://github.com/user-attachments/assets/acc6a018-4ef3-4986-aa3a-9f4cf1aed0c2" />

## Modelagem Física
Para finalizar o projeto, foi feita a implementação em PostgreSQL em cima das modelagens feitas anteriormente. A modelagem fisica pode ser conferida na pasta SQL do repositório.

### - Triggers
Nessa etapa, além das tabelas, foram implementadas algumas triggers que faziam mais sentido para a dinâmica de um restaurante.
#### 1 - Reservas
  Para respeitar a dinâmica de reservas do restaurante, quando se faz uma inserção na tabela Reservas, uma **trigger** é acionada para mudar o status da mesa escolhida para “Reservada” automaticamente, atualizando a situação da mesa. Após a criação da Reserva, outras duas triggers foram implementadas para tratar o seu andamento (update do status da Reserva). Caso o valor mude para "Concluida", indicando que a reserva foi efetivada, uma trigger é chamada para mudar o status da mesa para "Ocupada". Pelo contrário, caso o valor mude para "Cancelada", outra trigger é chamada para mudar o status da mesa para "Disponivel" novamente, liberando ela para receber possíveis novas reservas ou ocupações.<br>

#### 2 - Geração de Contas
  Outro caso é na geração de uma conta. A regra de negócio do banco diz, “Quando um pedido é concluído, ele gera uma conta”. Para essa frase fazer sentido, foi
implementado uma trigger que cria a conta do pedido após o status do próprio mudar para “Finalizado”. A conta é gerada com o valor de todos os itens do pedido, valor da taxa de serviço e o valor total a ser pago. Para finalizar, a trigger adiciona ao atributo comissao do Garcom o valor da taxa de serviço gerado pelo pedido.

#### 3 - Pagamentos da Conta
  O ultimo caso implementado é no pagamento da conta. Como diz a regra de negócio do banco, “Uma conta pode ser paga por mais de uma pessoa”. Logo, para isso fazer sentido, a conta só é fechada quando a soma dos valores pagos a ela é igual ao seu valor total, caso seja pago por mais de uma pessoa (gere mais de um pagamento). Então, quando se insere um registro de pagamento na tabela Pagamento, uma trigger é acionada para verificar se a conta for totalmente paga. Se sim, muda o status da Conta para “Paga”, se não, mantém o status “Aberta”.

## Conclusão

O desenvolvimento deste projeto permitiu aplicar, na prática, os principais conceitos estudados na disciplina de Banco de Dados I, desde a modelagem conceitual até a implementação física.

Além da estruturação do banco de dados, foram implementadas regras de negócio por meio de triggers, automatizando processos importantes como o gerenciamento de reservas, a geração de contas e o controle de pagamentos. Dessa forma, o projeto busca representar de maneira fiel a dinâmica de funcionamento de um restaurante, garantindo a integridade e a consistência dos dados.

Este trabalho demonstra a importância de um bom processo de modelagem para o desenvolvimento de bancos de dados robustos, organizados e preparados para atender às necessidades de sistemas reais.
