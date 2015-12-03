USE [SalesSystem]
GO

SELECT [Id],name
      ,[intergen_toplevelaccount]
      ,[intergen_topleveliskeyaccount]
  FROM [CrmCache].[account]
  where intergen_toplevelaccount IS NOT NULL
 -- and name like '%MMG%'
GO


dc9275da-42b3-e011-9251-002655875bb9

SELECT [Id],name
      ,[intergen_toplevelaccount]
      ,[intergen_topleveliskeyaccount]
  FROM [CrmCache].[account] where id = 'dc9275da-42b3-e011-9251-002655875bb9'