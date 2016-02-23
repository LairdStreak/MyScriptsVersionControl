USE [SalesSystem]
GO

DELETE ROLES FROM [CustomerPortal].[AspNetUserRoles] ROLES
  left join CustomerPortal.AspNetUsers USERS on ROLES.UserId = USERS.id
  left join CustomerPortal.AspNetRoles NETROLES on ROLES.RoleId = NETROLES.Id
  where ROLES.[RoleId] in ('8394b35f-e7df-4360-9cce-10b3d281b6f9','e6ea2951-7052-4074-b698-5a54e28ddc5e')
  and USERS.Email not in ('laird.streak@leapfrog3d.com','glen.richards@leapfrog3d.com','jo.beck@leapfrog3d.com')
GO