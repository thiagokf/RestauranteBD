# RestauranteBD
Projeto produzido como trabalho final da matéria de **Banco de dados I**.
O projeto consiste na estruturação de um Dominio, modelagem conceitual, lógica e fisica de um banco de dados para um restaurante, buscando atender todas as dinamicas do estabelecimento.

## Dominio
O dominio do restaurante dá um norte de como modelar o banco da forma que queremos que ele funcione.
Para melhor entendimento das modelagens do projeto, recomendo fazer a [leitura do dominio](https://github.com/thiagokf/RestauranteBD/blob/main/Dominio%20-%20Restaurante.pdf)

## Modelagem conceitual (ER)
A modelagem ER do banco nos permite começar a entender como sera a estrutura do banco, definindo as entidades, seus atributos e como elas vão se relacionar.
No projeto, podemos ver algumas conceitos da modelagem ER, como:
  - Especificações de colaboradores
  - A entidade associativa Pedidos
    - que faz a relação entre cliente e garçom, mas faz relacionamento com Conta, na geração, e ItensPedido, que fazem parte daquele pedido.
<img width="1245" height="833" alt="image" src="https://github.com/user-attachments/assets/4af9fc50-6698-4530-bdfa-43cd30bb8cc1" />
