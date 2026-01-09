-- ========================================
-- FASE 1: SETUP DO DATABASE
-- Data Warehouse Ataca Dez
-- ========================================

USE master;
GO

-- 1) Dropar se ja existir (CUIDADO: apaga tudo!)
IF DB_ID('DW_ATACADEZ') IS NOT NULL
BEGIN
    ALTER DATABASE DW_ATACADEZ SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DW_ATACADEZ;
END;
