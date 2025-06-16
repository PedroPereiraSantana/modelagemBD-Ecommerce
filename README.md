# 🛒 Modelagem de Banco de Dados - E-commerce

Este repositório apresenta a modelagem de banco de dados de um sistema de **E-commerce**, focando na etapa lógica e física. O objetivo é estruturar de forma eficiente os dados relacionados a clientes, produtos, pedidos, pagamentos, campanhas de marketing, estoque e administração.

## 🧮 Modelo Lógico

O modelo lógico define todas as tabelas, atributos, chaves primárias e estrangeiras, relacionamentos e regras de integridade referencial.

### Principais Tabelas

#### 📦 Produto_Iten_pedido
Tabela que une informações de **produto** com **itens de pedido**, permitindo registrar detalhes como nome, preço, categoria, imagem e quantidade comprada.

#### 👤 Cliente
Armazena os dados do cliente, como nome, e-mail, telefone e endereço (chave estrangeira para a tabela `endereco`).

#### 💳 Pagamento
Contém os dados sobre pagamentos efetuados, incluindo forma, valor e status.

#### 🛒 Pedido (implícito)
Embora a tabela `Pedido` não esteja isolada, suas informações estão incluídas em `Historico_pedido_Pedido`, representando tanto o pedido quanto seu histórico de status.

#### 🚚 Estoque e Histórico de Estoque
Controlam a disponibilidade de produtos e suas movimentações ao longo do tempo.

#### 📢 Campanhas_de_marketing e Cupons
Permitem gerenciar ações promocionais e cupons de desconto vinculados a campanhas.

#### 🧾 Devolução
Gerencia informações sobre pedidos devolvidos, incluindo data, motivo e status.

#### 👨‍💼 Administrador
Usuários responsáveis pela gestão do sistema e controle de estoque.

#### 🏡 Endereço
Endereços vinculados a clientes, com estrutura de país, rua, bairro, número e CEP.

---

## 🔗 Relacionamentos

- `Produto_Iten_pedido` → `Estoque`
- `Produto_Iten_pedido` → `Pedido` (pendente de definição completa)
- `Avaliacao_do_produto` → `Produto_Iten_pedido`
- `Historico_pedido_Pedido` → `Cliente` / `Devolucao`
- `Cupom` → `Pedido` / `Campanhas_de_marketing`
- `Efetua` → `Pagamento` e `Pedido`
- `Realiza` → `Cliente` e `Avaliacao_do_produto`
- `Atualiza` → `Historico_estoque` e `Produto_Iten_pedido`
- `Administra` → `Administrador` e `Estoque`

> ❗ Algumas **chaves estrangeiras estão incompletas ou pendentes**, como a referência a `Pedido` em várias tabelas. Recomenda-se revisar e completar essas relações no SQL.

---

## 🏗️ Modelo Físico

O modelo físico está implementado em SQL (MySQL ou compatível). Inclui:

- Criação de tabelas com `CREATE TABLE`
- Definição de chaves primárias
- Definição de relacionamentos com `FOREIGN KEY`
- Regras de exclusão como `ON DELETE CASCADE`, `ON DELETE RESTRICT`, `SET NULL`, etc.

### Exemplo de Tabela: Cliente
```sql
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    telefone VARCHAR,
    fk_endereco_endereco_PK INT
);
