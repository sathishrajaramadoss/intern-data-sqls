/**List of all migrated users**/
select 
aa.id as ConsumerId,
aa.emailaddress as Emailadderss, 
CASE WHEN (aa.Id=BB.[ConsumerId]) THEN 'Yes' ELSE 'No' END AS Upgraded,
CASE WHEN [services] like '%email_consent":true%' THEN 'Yes' ELSE 'No' END AS Email_opt
from consumer as aa
left join [dbo].[ConsentTransactions] as bb 
on aa.id=bb.consumerid
where POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 --nl migrated 
and aa.emailaddress<>''
---803382

/**List of all new accounts**/
select 
aa.id as ConsumerId, aa.emailaddress as Emailadderss, 
(CASE WHEN POWER(convert(bigint, 2), 728 % 63) & Taggroup9Flags > 0 THEN 'Yes' else 'No' END) AS Already_migrated,
(CASE WHEN [services] like '%email_consent":true%' THEN 'Yes' else 'No' END) AS Email_opt
from consumer as aa
left join [dbo].[ConsentTransactions] as bb 
on aa.id=bb.consumerid
where POWER(convert(bigint, 2), 727 % 63) & Taggroup12Flags > 0 --netherlands
and aa.emailaddress<>''
and cast(creationdate as date)>='2018-08-15'
--60667