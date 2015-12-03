SELECT
	Licensing.LicenseCreated.IxLicense,
	Licensing.LicenseCreated.IxDongle,
	Licensing.LicenseCreated.IxAccount,
	/*Licensing.LicenseCreated.IxPrevious,
	Licensing.LicenseCreated.IxUser,
	Licensing.LicenseCreated.Type,
	Licensing.LicenseCreated.Product,
	Licensing.LicenseCreated.Comment,
	Licensing.LicenseCreated.OnDemandAccount,
	Licensing.LicenseCreated.AllowScripts,
	Licensing.LicenseCreated.IsConversion,
	Licensing.LicenseCreated.IsMaintenance,
	Licensing.LicenseCreated.IsOnDemand,
	Licensing.LicenseCreated.IsPerpetual,
	Licensing.LicenseCreated.IsRenewal,
	Licensing.LicenseCreated.IsReplacement,
	Licensing.LicenseCreated.IsShort,
	Licensing.LicenseCreated.IsSynchronisation,
	Licensing.LicenseCreated.IsTransfer,
	Licensing.LicenseCreated.Restricted,
	Licensing.LicenseCreated.Reconstructed,
	Licensing.LicenseCreated.IxOnDemandEntitlement,
	Licensing.LicenseCreated.OdlOversubscription,
	Licensing.LicenseCreated.Starts,
	Licensing.LicenseCreated.Expires,
	Licensing.LicenseCreated.Created,
	Licensing.LicenseCreated.IxLicenceRequest,
	Licensing.LicenseCreated.Obsoleted,
	Licensing.LicenseCreated.IxCreateActionLog,
	Licensing.LicenseCreated.IxObsoletedActionLog,
	Licensing.LicenseCreated.ComputedEffectiveStart,
	Licensing.LicenseCreated.ComputedEffectiveExpiry,
	Licensing.LicenseCreated.IsConsultant,*/
	Licensing.LicenseCreated.IxCreateActionLog,
	Licensing.LicenseCreated.IxLicenceRequest,
	Licensing.LicenseCreated.Created,
	CrmCache.account.name
FROM
	Licensing.LicenseCreated INNER JOIN
    CrmCache.account ON Licensing.LicenseCreated.IxAccount = CrmCache.account.Id
WHERE
	(Licensing.LicenseCreated.OnDemandAccount = 'a6414cd2-b48d-e111-b8b3-002655875bb9') and CrmCache.account.name NOT LIKE '%Teck%'


Select * from Licensing.LicenceRequest
where IxLicenceRequest in (127255,127256,127257,113125,113126,113127,102661,102662)

Select * from Licensing.LicenseCreated where Created = '2015-09-09 07:03:31.6827078 +12:00'