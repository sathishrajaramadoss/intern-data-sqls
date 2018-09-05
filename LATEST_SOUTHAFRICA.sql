

----ZA_Exp1_Sample2----

SELECT sum([offer_redemption]) as ROW_COUNT
FROM [dbo].[Activity_Offer] aa
  inner join [dbo].[Consumer] bb
on aa.consumer_id = bb.id
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 692 % 63) & Taggroup11Flags > 0)----ZA_Exp1_Sample2
and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626

----ZA_Exp1_Sample3----
SELECT sum([offer_redemption]) as ROW_COUNT
FROM [dbo].[Activity_Offer] aa
  inner join [dbo].[Consumer] bb
on aa.consumer_id = bb.id
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 689 % 63) & Taggroup11Flags > 0)-- ZA_Exp1_Sample3
 and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626


----ZA_Exp2_Sample1----
SELECT sum([offer_redemption]) as ROW_COUNT
FROM [dbo].[Activity_Offer] aa
  inner join [dbo].[Consumer] bb
on aa.consumer_id = bb.id
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 690 % 63) & Taggroup11Flags > 0) -- ZA_Exp2_Sample1
and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626


----ZA_Exp2_Sample2-----
SELECT sum([offer_redemption]) as ROW_COUNT
FROM [dbo].[Activity_Offer] aa
  inner join [dbo].[Consumer] bb
on aa.consumer_id = bb.id
where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 691 % 63) & Taggroup11Flags > 0) -- ZA_Exp2_Sample2
and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626


----Number of Inactive Customers Activated ----
SELECT count (distinct consumer_id) as ROW_COUNT
FROM [dbo].[Activity_App] aa
  inner join [dbo].[Consumer] bb
  on aa.consumer_id = bb.id
 where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
AND (POWER(convert(bigint, 2), 690 % 63) & Taggroup11Flags > 0) -- ZA_Exp2_Sample1
and app_startup > 0
and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626

---Number of Lapsed Customers Activated ---

SELECT count (distinct consumer_id) as ROW_COUNT
FROM [dbo].[Activity_App] aa
  inner join [dbo].[Consumer] bb
  on aa.consumer_id = bb.id
 where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 691 % 63) & Taggroup11Flags > 0) -- ZA_Exp2_Sample2
and app_startup >0
and [source_activity_date_device] > 20180611
and [source_activity_date_device] <= 20180626

----Reactivation Rate in Inactive customer----








----Reactivation Rate in Lapsed customer----










select * from tagvalue 
where Referencecode like '%ZA_Exp2_Sample2%';

select * from tagvalue 
where Name like '%active%';


select top 10 *
 FROM [dbo].[Activity_App]
 where app_startup = 0
 where source_activity_date_device between '2018-06-12' and '2018-06-26';



 select count(1) from consumer
 where (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) -- South Africa
and (POWER(convert(bigint, 2), 691 % 63) & Taggroup11Flags > 0) -- ZA_Exp2_Sample2