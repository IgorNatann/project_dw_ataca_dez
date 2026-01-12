-- Desafio 1: crie no SQL Server um banco de dados chamado DW_PINGPONG

USE master;
GO

-- 1) Dropar se ja existir (CUIDADO: apaga tudo!)
IF DB_ID('DW_PINGPONG') IS NOT NULL
BEGIN
    ALTER DATABASE DW_PINGPONG SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DW_PINGPONG;
END;
GO

-- 2) Criar e selecionar o banco para o restante do setup
CREATE DATABASE DW_PINGPONG;
GO

ALTER DATABASE DW_PINGPONG SET MULTI_USER;
GO

USE DW_PINGPONG;
GO