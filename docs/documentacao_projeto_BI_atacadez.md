# Projeto de BI AtacaDez

# Dimensões

- **CLIENTE**
    - **Nível Input**
        - Cliente (CNPJ e Nome do Cliente)
    - **Atributos**
        - Tamanho do Cliente
    - **Hierarquias**
        - **Geográfica de Cliente**
            - Cliente
            - Cidade
            - Estado
            - Região
        - **Segmento**
            - Cliente
            - Segmento
        
- **PRODUTO**
    - **Nível Input**
        - Produto (SKU e Nome do Produto)
    - **Atributos**
        - Unidade de Medida
    - **Hierarquias**
        - **Fornecedor**
            - Produto
            - Fornecedor do Produto
        - **Departamento**
            - Produto
            - Setor
        
- **EMPRESA**
    - **Nível Input**
        - Loja (Identificador e Nome da Loja)
    - **Atributos**
        - Tipo de Loja
    - **Hierarquias**
        - **Fornecedor**
            - Loja
            - Empresa (CNPJ e Nome)
        
- **TICKET**
    - **Nível Input**
        - ID Sequencial (Sequencial do Item)
    - **Hierarquias**
        - Ticket
            - Sequencial do Item
            - Número do Ticket
        
- **TEMPO**
    - **Nível Input**
        - Data (Dia, Mês, Ano) - AAAAMMDD
    - **Atributos**
        - Dia da Semana
        - Fim de Semana
    - **Hierarquias**
        - Calendário
            - Dia
            - Mes
            - Trimestre
            - Semestre
            - Ano
        

# Indicadores

- **Lista de Indicadores**
    - Inputs
        - Quantidade Vendida
        - Valor da Venda
        - Preço Unitário de Compra
    - Calculados
        - Custo de Venda (Preço Unitário de Compra (Input) * Valor de Venda)
        - Preço Unitário de Venda (Valor da Venda / Quantidade Vendida)
        - Preço Unitário de Compra (Custo de Venda / Quantidade Vendida)
        - Lucro (Valor da Venda - Custo da Venda)
        - Rentabilidade ((Lucro / Valor da Venda) * 100)

# Matriz Dimensão Indicador

|  | CLIENTE | PRODUTO | EMPRESA | TICKET | TEMPO |
| --- | --- | --- | --- | --- | --- |
| Quantidade Vendida | X | X | X | X | X |
| Valor da Venda | X | X | X | X | X |
| Preço Unitário de Venda (Input) | X | X | X | X | X |
| Custo de Venda | X | X | X | X | X |
| Preço Unitário de Vendas | X | X | X | X | X |
| Preço Unitário de Compra | X | X | X | X | X |
| Lucro | X | X | X | X | X |
| Rentabilidade | X | X | X | X | X |