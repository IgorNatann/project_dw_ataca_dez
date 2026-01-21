CREATE TABLE [dbo].[tbl_empresa]
(
	[cod_loja] VARCHAR(25) NOT NULL PRIMARY KEY, 
    [desc_loja] VARCHAR(200) NOT NULL, 
    [desc_empresa] VARCHAR(200) NOT NULL, 
    [cod_empresa] VARCHAR(25) NOT NULL, 
    [tamanha_loja] FLOAT NOT NULL, 
    [arquivo_origem] VARCHAR(200) NOT NULL, 
    [data_carga] DATETIME NOT NULL
)
