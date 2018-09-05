
/**List of all migrated users**/
select aa.id as ConsumerId, aa.emailaddress as Emailadderss, 
(CASE WHEN POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 THEN 'Yes' else 'No' END) AS Already_Migrated,
(CASE WHEN [services] like '%email_consent":true%' THEN 'Yes' else 'No' END) AS Email_opt
from consumer as aa
left join [dbo].[ConsentTransactions] as bb 
on aa.id=bb.consumerid
where POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 and
POWER(convert(bigint, 2), 727 % 63) & Taggroup12Flags > 0 and aa.emailaddress<>''
--801,880

select count(1) from consumer where POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 and
POWER(convert(bigint, 2), 727 % 63) & Taggroup12Flags > 0 and emailaddress<>'' --791,912

select count(1) from consumer where POWER(convert(bigint, 2), 728 % 63) & Taggroup12Flags > 0 and emailaddress<>'' --792,085

/**List of all new accounts**/
select aa.id as ConsumerId, aa.emailaddress as Emailadderss, 
(CASE WHEN POWER(convert(bigint, 2), 728 % 63) & Taggroup9Flags > 0 THEN 'Yes' else 'No' END) AS Already_migrated,
(CASE WHEN [services] like '%email_consent":true%' THEN 'Yes' else 'No' END) AS Email_opt
from consumer as aa
left join [dbo].[ConsentTransactions] as bb 
on aa.id=bb.consumerid
where POWER(convert(bigint, 2), 727 % 63) & Taggroup12Flags > 0 and aa.emailaddress<>''
and cast(creationdate as date)>='2018-08-15'
--54,098


--Netherlands New Email Users	727 --
--NL Migrated	728 --

select count(id) from consumer
where POWER(convert(bigint, 2), 727 % 63) & Taggroup12Flags > 0 and emailaddress<>''
and cast(creationdate as date)>='2018-08-15'
--833,773
