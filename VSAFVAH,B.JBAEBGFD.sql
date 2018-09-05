select * from [legacyNL].[TagValue]
where referencecode like '%CA_NewsletterSubs%'

select * from [gmalNL].[TagValue]
where name like '%consent%'

select count(1) from [gmalNL].[Consumer]
where POWER(convert(bigint, 2), 480 % 63) & Taggroup8Flags > 0

select 
aa.emailaddress as Emailadderss, 
aa.id as GMAL_ConsumerId, 
ab.id as TCB_ConsumerId, 
--(CASE WHEN POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 THEN 'Yes' else 'No' END) AS Already_Migrated,
--(CASE WHEN [services] like '%email_consent":true%' THEN 'Yes' else 'No' END) AS GMAL_Email_opt,
(CASE WHEN POWER(convert(bigint, 2), 445 % 63) & ab.Taggroup8Flags > 0 THEN 'Yes' else 'No' END) AS TCB_Email_opt
from [gmalNL].[Consumer] as aa
left join [legacyNL].[Consumer] ab
on aa.emailaddress = ab.emailaddress 
where aa.emailaddress<>''
--841849