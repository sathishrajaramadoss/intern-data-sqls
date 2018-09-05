/*what the average and also peak number of active users across a week on a daily basis.
If that is difficult just choose a day with the highest number 
and if we could potentially get a breakdown within the day that would be good. 
If that is not possible let me know what you can do.
Ultimately I want to know how many users on average.*/

/** daily active users **/

SELECT  distinct year(CONVERT(DATE, [sourceactivitytimedevice])) as year, 
month(CONVERT(DATE, [sourceactivitytimedevice])) as month, 
day(CONVERT(DATE, [sourceactivitytimedevice])) as day, count(distinct consumerid) as ROW_COUNT

  FROM [dbo].[Activity_Raw] aa
  inner join [dbo].[Consumer] bb
  on aa.consumerid = bb.id
  where POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 and cast([sourceactivitytimedevice] as date) >= '2018-02-01'
  and actiontypecode = 7
  group by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice])) , 
  day(CONVERT(DATE, [sourceactivitytimedevice])),[actiontypecode]
  
  order by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice])) , 
  day(CONVERT(DATE, [sourceactivitytimedevice]))

  /** monthly active users **/
  SELECT  distinct year(CONVERT(DATE, [sourceactivitytimedevice])) as year, 
month(CONVERT(DATE, [sourceactivitytimedevice])) as month, count(distinct consumerid) as ROW_COUNT

  FROM [dbo].[Activity_Raw] aa
  inner join [dbo].[Consumer] bb
  on aa.consumerid = bb.id
  where POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 and cast([sourceactivitytimedevice] as date) >= '2018-02-01'
  and actiontypecode = 7
  group by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice])) ,[actiontypecode]
  
  order by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice]))


  /** weekly active users **/

SELECT distinct year(CONVERT(DATE, [sourceactivitytimedevice])) as year, 
	month(CONVERT(DATE, [sourceactivitytimedevice])) as month, 
	'Week ' + cast(datepart(wk, [sourceactivitytimedevice]) as varchar(2)) Week,
	count(distinct consumerid) as ROW_COUNT
FROM [dbo].[Activity_Raw] aa
	inner join [dbo].[Consumer] bb
on aa.consumerid = bb.id
where POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 and cast([sourceactivitytimedevice] as date) >= '2018-02-01'
	and actiontypecode = 7
group by year(CONVERT(DATE, [sourceactivitytimedevice])), 
			month(CONVERT(DATE, [sourceactivitytimedevice])),'Week ' + cast(datepart(wk, [sourceactivitytimedevice])as varchar(2)) ,[actiontypecode]
  
order by year(CONVERT(DATE, [sourceactivitytimedevice])), 
			month(CONVERT(DATE, [sourceactivitytimedevice])),'Week ' + cast(datepart(wk, [sourceactivitytimedevice])as varchar(2))



 /** Peak days 4-19, 6-23 **/

 SELECT distinct year(CONVERT(DATE, [sourceactivitytimedevice])) as year, 
month(CONVERT(DATE, [sourceactivitytimedevice])) as month, 
day(CONVERT(DATE, [sourceactivitytimedevice])) as day,
DATEPART(hour, [sourceactivitytimedevice]) as hour,
	count(distinct consumerid) as ROW_COUNT
FROM [dbo].[Activity_Raw] aa
	inner join [dbo].[Consumer] bb
on aa.consumerid = bb.id
where POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 
	and cast([sourceactivitytimedevice] as date) IN ('2018/04/19','2018-06-23')
	and actiontypecode = 7
group by year(CONVERT(DATE, [sourceactivitytimedevice])), 
month(CONVERT(DATE, [sourceactivitytimedevice])) , 
day(CONVERT(DATE, [sourceactivitytimedevice])),
DATEPART(hour, [sourceactivitytimedevice]),
[actiontypecode]
  
order by year(CONVERT(DATE, [sourceactivitytimedevice])), 
month(CONVERT(DATE, [sourceactivitytimedevice])) , 
day(CONVERT(DATE, [sourceactivitytimedevice])),
DATEPART(hour, [sourceactivitytimedevice]);