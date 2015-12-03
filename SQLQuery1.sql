USE [SalesSystem]
GO

SELECT [Id]
      ,[date]
      ,[accountId]
      ,[product]
      ,[entitlements]
      ,[green]
      ,[amber]
      ,[red]
      ,[maxseats]
  FROM [Licensing].[ODLStamp]
  where product = 'geo'
GO

Select * from Licensing.DongleRegistered where IxDongle = 3672 DongleNumber = 1859181792


Select id,name from CrmCache.account
where id in (Select distinct OnDemandAccount from SalesSystem.Licensing.LicenseCreated
where IxDongle in (Select distinct IxDongle from SalesSystem.Licensing.LicenseCreated where OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9'))--in(8035,6090))

Select id,name from CrmCache.account where id = 'a6414cd2-b48d-e111-b8b3-002655875bb9'


Select * from SalesSystem.Licensing.LicenseCreated where OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9'

Select * from SalesSystem.Licensing.LicenseCreated where OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9'
--a6414cd2-b48d-e111-b8b3-002655875bb9
--a6414cd2-b48d-e111-b8b3-002655875bb9' --IxDongle = 8035 --6090 --and OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9'

Select * from SalesSystem.Licensing.OnDemandEntitlement where IxOnDemand in (11072,11073,11074)-- in (Select distinct IxOnDemandEntitlement from SalesSystem.Licensing.LicenseCreated where IxDongle = 6090 and OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9')

--Select * from Licensing.Users
--where IxUser = '207700f9-f1c9-e011-9276-002655875bb9'

Select * from Licensing.ActionLog 
where IxActionLog =293915

--Select * from Licensing.ActionLogAccount where IxActionLog = 11072

Select * from Licensing.LicenseCreated
where IxLicense = (select MAX(IxLicense) from Licensing.LicenseCreated)

Select name from CrmCache.account where id = 'b1d175d5-88f4-41fc-a8fb-d6c71ad35e30'
Select name from CrmCache.account where id = '1ba523ee-fe0e-458e-937e-de4889fd5275'
Select name from CrmCache.account where id = '4ce48184-410e-4144-8cfa-2644c29d423a'
Select name from CrmCache.account where id = 'c3f18c2e-3af3-44aa-aab4-40c80cc66928'



Select * from Licensing.LicenseCreated where IxDongle in (8035,5586,6090,3672)
and OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9'
and IxAccount in ('b1d175d5-88f4-41fc-a8fb-d6c71ad35e30','1ba523ee-fe0e-458e-937e-de4889fd5275','4ce48184-410e-4144-8cfa-2644c29d423a','c3f18c2e-3af3-44aa-aab4-40c80cc66928')
