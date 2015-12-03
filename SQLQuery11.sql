USE [SalesSystem]
GO

SELECT        Licensing.ODLStamp.Id, Licensing.ODLStamp.date, Licensing.ODLStamp.accountId, Licensing.ODLStamp.product, Licensing.ODLStamp.entitlements, Licensing.ODLStamp.green, Licensing.ODLStamp.amber, 
                         Licensing.ODLStamp.red, Licensing.ODLStamp.maxseats, Licensing.ODLUser.accountId AS Expr1, Licensing.ODLUser.name, Licensing.ODLUser.dongleNumber
FROM            Licensing.ODLStamp INNER JOIN
                         Licensing.ODLUser ON Licensing.ODLStamp.Id = Licensing.ODLUser.stampId
  --where Licensing.ODLStamp.accountId = 'a6414cd2-b48d-e111-b8b3-002655875bb9'
  where Licensing.ODLUser.name like '%Sal%'
  and Licensing.ODLStamp.Id in (1579698,
1580574,
1583192,
1584070,
1579698,
1580574,
1583192,
1584070,
1579698,
1580574,
1583192,
1584070)
GO


--Select * from Licensing.ODLUser where stampId = 21053

Select * from Licensing.ODLStamp where accountId = 'a6414cd2-b48d-e111-b8b3-002655875bb9'
order by [date] ASC
Select * from Licensing.ODLUser where name like '%Hupaelo%'

Select * from Licensing.DongleRegistered where DongleNumber = 1859181792

Select * from Licensing.LicenseCreated where IxDongle = 8035

Select Name from CrmCache.account where id = 'dd35003d-6a16-45b9-ae14-f9f47d358db7'
Select Name from CrmCache.account where id = 'c86a7a42-a61c-4bf4-abce-edef3cbcf912'

Select * from Licensing.LicenseCreated where Comment like '%|Note'

Select name,* from CrmCache.account where id = '1ba523ee-fe0e-458e-937e-de4889fd5275'

