USE [SalesSystem]
GO

SELECT [Subject] as 'Login User Email'
      ,[IssuedUtc] as 'Login Date'
      ,[ExpiresUtc] as 'Login Expires'
  FROM [CustomerPortal].[RefreshTokens]
  Order By IssuedUtc DESC
GO


