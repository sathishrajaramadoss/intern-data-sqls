/*Recent app start date*/
select consumer_id as [id],max(convert(date,CONVERT(varchar(10),[source_activity_date_device],101))) as [App_Latest_date] into #temp 
from Activity_App
where [app_startup]>0
group by consumer_id

/*App Creation Date*/
select id as [id], convert(date,creationdate) as [Creation_Date] into #temp1
from Consumer

/*App Redemption*/
select consumer_id as [id],max(convert(date,CONVERT(varchar(10),[source_activity_date_device],101))) as [Redemption_Latest_date] into #temp2
from Activity_Offer
where [offer_redemption]>0
group by consumer_id

--------------------------------------------------------------------------------------------------------------
/*App open diffference*/
select SUM(DATEDIFF(day,[Creation_Date],[App_Latest_date]))/COUNT(DISTINCT aa.Id) as [Average]
from Consumer as aa
inner join #temp as bb
on bb.[id]=aa.id
inner join #temp1 as cc
on cc.[id]=aa.id
where POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0
and emailaddress<>''
and EmailAddress is not null

/*App Redemption diffference*/
select SUM(DATEDIFF(day,[Creation_Date],[Redemption_Latest_date]))/COUNT(DISTINCT aa.Id) as [Average_Redemption]
from Consumer as aa
inner join #temp2 as bb
on bb.[id]=aa.id
inner join #temp1 as cc
on cc.[id]=aa.id
where POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0
and emailaddress<>''
and EmailAddress is not null
---------------------------------------------------------------------------------------------------------------
















drop table #temp
drop table #temp1
drop table #temp2

select case
when POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 then 564   -- DK
             when POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 then 565   -- GR
             when POWER(convert(bigint, 2),  24 % 63) & TagGroup1Flags  > 0 then 568   -- SA
             when POWER(convert(bigint, 2), 239 % 63) & TagGroup4Flags  > 0 then 573   -- CR
             when POWER(convert(bigint, 2), 275 % 63) & TagGroup5Flags  > 0 then 576   -- MR
             when POWER(convert(bigint, 2), 295 % 63) & TagGroup5Flags  > 0 then 577   -- JE
             when POWER(convert(bigint, 2), 371 % 63) & TagGroup6Flags  > 0 then 581   -- FL
             when POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 then 579   -- SW
             when POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 then 582   -- SN
             when POWER(convert(bigint, 2), 406 % 63) & TagGroup7Flags  > 0 then 585   -- JN
             when POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 then 589   -- PL
             when POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 then 587   -- IT
             when POWER(convert(bigint, 2), 489 % 63) & TagGroup8Flags  > 0 then 591   -- HU
             when POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0 then 595   -- KU
             when POWER(convert(bigint, 2), 490 % 63) & TagGroup8Flags  > 0 then 592   -- NZ
             when POWER(convert(bigint, 2), 513 % 63) & TagGroup9Flags  > 0 then 597   -- PK
             when POWER(convert(bigint, 2), 549 % 63) & Taggroup9Flags  > 0 then 600   -- BF
             when POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0 then 602   -- ZA
             when POWER(convert(bigint, 2), 592 % 63) & Taggroup10Flags > 0 then 604   -- QA
             when POWER(convert(bigint, 2), 619 % 63) & Taggroup10Flags > 0 then 606   -- TR
             when POWER(convert(bigint, 2), 620 % 63) & Taggroup10Flags > 0 then 611   -- ES
             when POWER(convert(bigint, 2), 621 % 63) & Taggroup10Flags > 0 then 612   -- LA
             when POWER(convert(bigint, 2), 622 % 63) & Taggroup10Flags > 0 then 613   -- LI
             when POWER(convert(bigint, 2), 279 % 63) & Taggroup5Flags  > 0 then 617   -- MY
             when POWER(convert(bigint, 2),  93 % 63) & Taggroup2Flags  > 0 then 621   -- ON
             when POWER(convert(bigint, 2), 184 % 63) & Taggroup3Flags  > 0 then 627   -- GR
             when POWER(convert(bigint, 2),  92 % 63) & Taggroup2Flags  > 0 then 619   -- GT
             when POWER(convert(bigint, 2), 172 % 63) & Taggroup3Flags  > 0 then 623   -- UE
             when POWER(convert(bigint, 2), 174 % 63) & Taggroup3Flags  > 0 then 625   -- BN
             when POWER(convert(bigint, 2), 197 % 63) & Taggroup4Flags  > 0 then 629   -- SV
             when POWER(convert(bigint, 2), 665 % 63) & Taggroup11Flags > 0 then 631   -- HN
             when POWER(convert(bigint, 2), 666 % 63) & Taggroup11Flags > 0 then 634   -- NI
             when POWER(convert(bigint, 2), 713 % 63) & Taggroup12Flags > 0 then 636   -- EG
             end as 'merchantid',
			 SUM(DATEDIFF(day,[Creation_Date],[App_Latest_date]))/COUNT(DISTINCT aa.Id) as [Average]
			 ---SUM(DATEDIFF(day,[Creation_Date],[Redemption_Latest_date]))/COUNT(DISTINCT aa.Id) as [Average_Redemption]
from Consumer as aa
inner join #temp as bb
on bb.[id]=aa.id
inner join #temp1 as cc
on cc.[id]=aa.id

--from consumer as aa
--inner join #temp as bb
--on bb.[id]=aa.id
--inner join #temp1 as cc
--on cc.[id]=aa.id
--inner join #temp2 as dd
--on dd.[id]=aa.id
where emailaddress<>''
and emailaddress is not null
and CreationDate<= DATEADD(month, -3, getdate())
group by case
             when POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 then 564   -- DK
             when POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 then 565   -- GR
             when POWER(convert(bigint, 2),  24 % 63) & TagGroup1Flags  > 0 then 568   -- SA
             when POWER(convert(bigint, 2), 239 % 63) & TagGroup4Flags  > 0 then 573   -- CR
             when POWER(convert(bigint, 2), 275 % 63) & TagGroup5Flags  > 0 then 576   -- MR
             when POWER(convert(bigint, 2), 295 % 63) & TagGroup5Flags  > 0 then 577   -- JE
             when POWER(convert(bigint, 2), 371 % 63) & TagGroup6Flags  > 0 then 581   -- FL
             when POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 then 579   -- SW
             when POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 then 582   -- SN
             when POWER(convert(bigint, 2), 406 % 63) & TagGroup7Flags  > 0 then 585   -- JN
             when POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 then 589   -- PL
             when POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 then 587   -- IT
             when POWER(convert(bigint, 2), 489 % 63) & TagGroup8Flags  > 0 then 591   -- HU
             when POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0 then 595   -- KU
             when POWER(convert(bigint, 2), 490 % 63) & TagGroup8Flags  > 0 then 592   -- NZ
             when POWER(convert(bigint, 2), 513 % 63) & TagGroup9Flags  > 0 then 597   -- PK
             when POWER(convert(bigint, 2), 549 % 63) & Taggroup9Flags  > 0 then 600   -- BF
             when POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0 then 602   -- ZA
             when POWER(convert(bigint, 2), 592 % 63) & Taggroup10Flags > 0 then 604   -- QA
             when POWER(convert(bigint, 2), 619 % 63) & Taggroup10Flags > 0 then 606   -- TR
             when POWER(convert(bigint, 2), 620 % 63) & Taggroup10Flags > 0 then 611   -- ES
             when POWER(convert(bigint, 2), 621 % 63) & Taggroup10Flags > 0 then 612   -- LA
             when POWER(convert(bigint, 2), 622 % 63) & Taggroup10Flags > 0 then 613   -- LI
             when POWER(convert(bigint, 2), 279 % 63) & Taggroup5Flags  > 0 then 617   -- MY
             when POWER(convert(bigint, 2),  93 % 63) & Taggroup2Flags  > 0 then 621   -- ON
             when POWER(convert(bigint, 2), 184 % 63) & Taggroup3Flags  > 0 then 627   -- GR
             when POWER(convert(bigint, 2),  92 % 63) & Taggroup2Flags  > 0 then 619   -- GT
             when POWER(convert(bigint, 2), 172 % 63) & Taggroup3Flags  > 0 then 623   -- UE
             when POWER(convert(bigint, 2), 174 % 63) & Taggroup3Flags  > 0 then 625   -- BN
             when POWER(convert(bigint, 2), 197 % 63) & Taggroup4Flags  > 0 then 629   -- SV
             when POWER(convert(bigint, 2), 665 % 63) & Taggroup11Flags > 0 then 631   -- HN
             when POWER(convert(bigint, 2), 666 % 63) & Taggroup11Flags > 0 then 634   -- NI
             when POWER(convert(bigint, 2), 713 % 63) & Taggroup12Flags > 0 then 636   -- EG
             end
order by merchantid
