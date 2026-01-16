USE [DW_ATACADEZ]
GO

SET IDENTITY_INSERT [dbo].[dim_cliente] ON 
GO

INSERT INTO [dbo].[dim_cliente]
           ([id_cliente]
           ,[cod_cliente]
           ,[desc_cliente]
           ,[atr_tamanho_cliente]
           ,[cod_cidade]
           ,[desc_cidade]
           ,[cod_estado]
           ,[desc_estado]
           ,[cod_regiao]
           ,[desc_regiao]
           ,[cod_segmento]
           ,[desc_segmento])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT [dbo].[dim_cliente] OFF 
GO

SELECT * FROM [dbo].[dim_cliente];


USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_departamento]
           ([cod_setor]
           ,[desc_setor])
     VALUES
           ('ND'
           ,'ND')
GO

SELECT * FROM [dbo].[dim_departamento];

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_fornecedor]
           ([cod_fornecedor]
           ,[desc_fornecedor])
     VALUES
           ('ND'
           ,'ND')
GO

SELECT * FROM [dbo].[dim_fornecedor];

USE [DW_ATACADEZ]
GO

SET IDENTITY_INSERT [dbo].[dim_produto] ON

INSERT INTO [dbo].[dim_produto]
           ([id_produto]
           ,[cod_produto]
           ,[desc_produto]
           ,[atr_unidade_medida]
           ,[cod_fornecedor]
           ,[cod_setor])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT [dbo].[dim_produto] OFF
GO

SELECT * FROM [dbo].[dim_produto];

USE [DW_ATACADEZ]
GO

SET IDENTITY_INSERT [dbo].[dim_empresa] ON 
GO

INSERT INTO [dbo].[dim_empresa]
           ([id_loja]
           ,[cod_loja]
           ,[desc_loja]
           ,[atr_tipo_loja]
           ,[cod_empresa]
           ,[desc_empresa])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT [dbo].[dim_empresa] OFF
GO

SELECT * FROM [dbo].[dim_empresa];