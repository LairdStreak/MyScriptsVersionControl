WITH mycte([Id], [name], [parentid], [level]) AS (SELECT        Id, name, Id AS Expr1, 1 AS Expr2
                                                                                                     FROM            CrmCache.account
                                                                                                     WHERE        (parentaccountid IS NULL)
                                                                                                     UNION ALL
                                                                                                     SELECT        CRMA.Id, CRMA.name, CRMA.parentaccountid, r.[level] + 1 AS Expr1
                                                                                                     FROM            CrmCache.account AS CRMA INNER JOIN
                                                                                                                              mycte AS r ON CRMA.parentaccountid = r.Id)
    SELECT        mycte_1.[Id], mycte_1.[name], CON.Id AS Expr1, CON.firstname, CON.lastname
     FROM            mycte AS mycte_1 LEFT OUTER JOIN
                              CrmCache.contact AS CON ON CON.parentcustomerid = mycte_1.[Id]
     WHERE        (mycte_1.[parentid] = 'a6414cd2-b48d-e111-b8b3-002655875bb9')
     ORDER BY mycte_1.[level]