/*
Script de implantação para DL_ATACADEZ

Esse código foi gerado por uma ferramenta.
Alterações nesse arquivo podem causar comportamento incorreto e serão perdidas se
o código for regenerado.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DL_ATACADEZ"
:setvar DefaultFilePrefix "DL_ATACADEZ"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar modo SQLCMD e desabilitar a execução do script se o modo SQLCMD não for suportado.
Para reabilitar o script após habilitar o modo SQLCMD, execute o seguinte:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave ca14c486-48b0-4636-a89b-5e7bcadd2e34 foi ignorada; o elemento [dbo].[tbl_empresa].[Id] (SqlSimpleColumn) não será renomeado para cod_loja';


GO
PRINT N'A operação de refatoração Renomear com chave d0176612-4a30-402d-a216-41ad25026cc9 foi ignorada; o elemento [dbo].[tbl_cliente].[Id] (SqlSimpleColumn) não será renomeado para cod_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 71c78801-36a9-4656-94b5-4731787b162d foi ignorada; o elemento [dbo].[tbl_cliente].[faturamente] (SqlSimpleColumn) não será renomeado para faturamento';


GO
PRINT N'A operação de refatoração Renomear com chave efa3a16d-63ee-4a94-bbf8-09e47e7d8028 foi ignorada; o elemento [dbo].[tbl_cliente].[desc_idade] (SqlSimpleColumn) não será renomeado para desc_cidade';


GO
PRINT N'A operação de refatoração Renomear com chave 15f7aa51-f919-4d29-b09d-6a5ba1ac4cfe foi ignorada; o elemento [dbo].[tbl_produtos].[Id] (SqlSimpleColumn) não será renomeado para cod_produto';


GO
PRINT N'Criando Tabela [dbo].[tbl_cliente]...';


GO
CREATE TABLE [dbo].[tbl_cliente] (
    [cod_cliente]    VARCHAR (25)  NOT NULL,
    [desc_cliente]   VARCHAR (200) NULL,
    [endereco]       VARCHAR (200) NULL,
    [faturamento]    FLOAT (53)    NULL,
    [desc_segmento]  VARCHAR (200) NULL,
    [desc_cidade]    VARCHAR (200) NULL,
    [cod_estado]     VARCHAR (25)  NULL,
    [desc_estado]    VARCHAR (200) NULL,
    [desc_regiao]    VARCHAR (200) NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_cliente] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_empresa]...';


GO
CREATE TABLE [dbo].[tbl_empresa] (
    [cod_loja]       VARCHAR (25)  NOT NULL,
    [desc_loja]      VARCHAR (200) NOT NULL,
    [desc_empresa]   VARCHAR (200) NOT NULL,
    [cod_empresa]    VARCHAR (25)  NOT NULL,
    [tamanha_loja]   FLOAT (53)    NOT NULL,
    [arquivo_origem] VARCHAR (200) NOT NULL,
    [data_carga]     DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([cod_loja] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_produtos]...';


GO
CREATE TABLE [dbo].[tbl_produtos] (
    [cod_produto]        VARCHAR (25)  NOT NULL,
    [desc_produto]       VARCHAR (200) NULL,
    [desc_departamento]  VARCHAR (200) NULL,
    [atr_unidade_medida] VARCHAR (50)  NULL,
    [cod_fornecedor]     VARCHAR (25)  NULL,
    [desc_fornecedor]    VARCHAR (200) NULL,
    [arquivo_origem]     VARCHAR (200) NULL,
    [data_carga]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_produto] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ca14c486-48b0-4636-a89b-5e7bcadd2e34')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ca14c486-48b0-4636-a89b-5e7bcadd2e34')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd0176612-4a30-402d-a216-41ad25026cc9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d0176612-4a30-402d-a216-41ad25026cc9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '71c78801-36a9-4656-94b5-4731787b162d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('71c78801-36a9-4656-94b5-4731787b162d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'efa3a16d-63ee-4a94-bbf8-09e47e7d8028')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('efa3a16d-63ee-4a94-bbf8-09e47e7d8028')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '15f7aa51-f919-4d29-b09d-6a5ba1ac4cfe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('15f7aa51-f919-4d29-b09d-6a5ba1ac4cfe')

GO

GO
PRINT N'Atualização concluída.';


GO
