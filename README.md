# Data Warehouse AtacaDez

Repositorio do curso/projeto de BI para o atacadista AtacaDez. Inclui dados brutos, scripts SQL de montagem do Data Lake/DW e solucoes SSIS/SSDT para a carga.

## Estrutura
- docs/documentacao_projeto_BI_atacadez.md: resumo das dimensoes, indicadores e matriz de analise.
- sources/ETL/: staging com cadastros de empresa, clientes, fornecedores, produtos; subpastas compra/ e mov/ com notas e itens mensais; scripts/ com snippets de transformacao (conversao de data, parser JSON de produtos, updates de dimensoes).
- sources/projects/versao001/DatawarehouseAtacaDez: solucao VS com pacote SSIS CargaDataWarehouse (Package.dtsx) e projeto SSDT CriacaoDataLake.
- sources/projects/versao002/DatawarehouseAtacaDez: revisao da solucao com builds (.ispac/.dacpac) e script de staging Tabelas/tbl_empresa.sql.
- sql/01_setup/: cria os bancos DW_ATACADEZ e DL_ATACADEZ, configura recovery, define tabelas dimensionais e fato, e insere linhas ND nas dimensoes.
- dw_project/dw_atacadez_001.architect: modelo dimensional com dim_cliente, dim_produto, dim_empresa, dim_tempo etc.
- atividades/01_create_database.sql: exercicio de criacao de banco inicial.

## Modelo dimensional e medidas
- Dimensoes: dim_tempo (calendario), dim_departamento, dim_fornecedor, dim_produto, dim_cliente (geografia e segmento), dim_empresa (tipo de loja).
- Fato: fact_venda referenciando loja, cliente, produto e tempo com medidas quantidade_vendida, valor_venda e custo_venda; suportam calculo de preco unitario, lucro e rentabilidade descritos em docs/documentacao_projeto_BI_atacadez.md.
- Scripts de ajuste (sql/01_setup/04_ajuste_dw.sql) adicionam registros ND para chaves desconhecidas em todas as dimensoes, incluindo tempo.

## Dados de origem para a camada de captura
- sources/ETL/EMPRESA.CSV: lojas com CNPJ e tamanho.
- CADASTRO DE CLIENTES.xlsx, FORNECEDORES.XML + FORNECEDORES.xsd, PRODUTOS.JSON: cadastros base de clientes, fornecedores e produtos.
- sources/ETL/compra/*.csv: compras mensais de 2021 a 2023.
- sources/ETL/mov/Movimento_*: notas e itens mensais de 2021 a 2023.
- snippets em sources/ETL/scripts/ indicam transformacoes para conversao de data, leitura de JSON, regras de tamanho de cliente/loja e updates de dimensao.

## Status ate o momento
- Dados brutos e scripts de apoio versionados para as camadas de DL/DW.
- Estrutura de bancos e tabelas definida em sql/01_setup/.
- Modelo dimensional documentado em docs/documentacao_projeto_BI_atacadez.md e no arquivo dw_project/dw_atacadez_001.architect.
- Projetos SSIS/SSDT criados em sources/projects/versao00{1,2} para orquestrar cargas; versao002 inclui builds gerados (.ispac, .dacpac) e script Tabelas/tbl_empresa.sql.
