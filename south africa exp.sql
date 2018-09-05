--sample 1--
select 
count(1) as User_Count
from [dbo].[Consumer]
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 63 % 63) & Taggroup2Flags > 0) -- Email
and (POWER(convert(bigint, 2), 305 % 63) & TagGroup5Flags > 0) -- High Redemption
and not((POWER(convert(bigint, 2), 84 % 63) & Taggroup2Flags > 0)or(POWER(convert(bigint, 2),79 % 63) & Taggroup2Flags > 0))-- email not reg in last 30 days 

--sample 2--
select 
count(1) as User_Count
from [dbo].[Consumer]
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 63 % 63) & Taggroup2Flags > 0) -- Email
and (POWER(convert(bigint, 2), 304 % 63) & TagGroup5Flags > 0) -- Regular Redemption
and not((POWER(convert(bigint, 2), 84 % 63) & Taggroup2Flags > 0)or(POWER(convert(bigint, 2),79 % 63) & Taggroup2Flags > 0))-- email not reg in last 30 days 

--sample 3--
select 
count(1) as User_Count
from [dbo].[Consumer]
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 63 % 63) & Taggroup2Flags > 0) -- Email
and not((POWER(convert(bigint, 2), 84 % 63) & Taggroup2Flags > 0)or(POWER(convert(bigint, 2),79 % 63) & Taggroup2Flags > 0))-- email not reg in last 30 days 
and not((POWER(convert(bigint, 2), 305 % 63) & TagGroup5Flags > 0)or(POWER(convert(bigint, 2), 304 % 63) & TagGroup5Flags > 0))--Not(High OR Regular Redemption Beef)

--sample 1(inactive target)----
select 
count(1) as User_Count
from [dbo].[Consumer]
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 63 % 63) & Taggroup2Flags > 0) -- Email
and (POWER(convert(bigint, 2), 43 % 63) & Taggroup1Flags > 0)-- Last opened app in past 31 to 60days
and not((POWER(convert(bigint, 2), 84 % 63) & Taggroup2Flags > 0)or(POWER(convert(bigint, 2),79 % 63) & Taggroup2Flags > 0))-- email not reg in last 30 days 
and not(POWER(convert(bigint, 2), 74 % 63) & Taggroup2Flags > 0)-- not sample group8

--Sample 2(Lapsed Target)
select 
count(1) as User_Count
from [dbo].[Consumer]
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 63 % 63) & Taggroup2Flags > 0) -- Email
and (POWER(convert(bigint, 2), 44 % 63) & Taggroup1Flags > 0)-- Last opened app in past 61 to 90 days
and not((POWER(convert(bigint, 2), 84 % 63) & Taggroup2Flags > 0)or(POWER(convert(bigint, 2),79 % 63) & Taggroup2Flags > 0))-- email not reg in last 30 days
and not(POWER(convert(bigint, 2), 74 % 63) & Taggroup2Flags > 0)-- not sample group8












select top 10 * from [dbo].[Consumer]

select * from tagvalue
where Referencecode like '%ZA_Exp2_Sample1%';

select * from dbo.TagValue
where Referencecode like '%group%';
