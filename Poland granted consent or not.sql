select * from tagvalue
where ReferenceCode like '%marketing_PL_accepted%';
--462
select * from tagvalue
where ReferenceCode like '%marketing_PL_Not_Accepted%';
--467

---GDPR Email Consent = TRUE
select count(distinct[ConsumerId]) as Users_email from consumer aa
INNER join 
	(SELECT *, ROW_NUMBER () OVER (PARTITION BY ConsumerId ORDER BY timestamp desc) AS rownum
	FROM [dbo].[ConsentTransactions]) bb 
on aa.id=bb.[ConsumerId]
where POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 
and [Services] like '%email_consent":true%'
AND rownum = 1
--917,804

---GDPR Email Consent = FALSE
select count(distinct[ConsumerId]) as Users_email from consumer aa
INNER join 
	(SELECT *, ROW_NUMBER () OVER (PARTITION BY ConsumerId ORDER BY timestamp desc) AS rownum
	FROM [dbo].[ConsentTransactions]) bb 
on aa.id=bb.[ConsumerId]
where POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 
and [Services] not like '%email_consent":true%'
AND rownum = 1
--745,134

--marketing_PL_accepted
select count(distinct id) as Users_Total from consumer aa
where POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 
AND POWER(convert(bigint, 2), 462 % 63) & TagGroup8Flags  > 0 
AND EMAILADDRESS<>''
AND id not in (select consumerid from [dbo].[ConsentTransactions])
--754,851


--marketing_PL_Not_Accepted
select count(distinct id) as Users_Total from consumer aa
where POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 
AND POWER(convert(bigint, 2), 467 % 63) & TagGroup8Flags  > 0 
AND EMAILADDRESS<>''
AND id not in (select consumerid from [dbo].[ConsentTransactions])
--448,445

select count(1) from consumer
where emailaddress<>''
and POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 
--2866342
