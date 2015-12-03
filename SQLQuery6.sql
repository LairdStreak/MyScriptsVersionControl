USE [SalesSystem]
GO

SELECT min([IxLicense])
  FROM [Licensing].[LicenseCreated]
  where IsOnDemand = 1
GO

Select * from Licensing.LicenseCreated where IxLicense = 330637




Select IxUser,ixaccount,
name = (select name from CrmCache.account where accountid = ixaccount)
,* from Licensing.OnDemandEntitlement
where IxOnDemand = 534