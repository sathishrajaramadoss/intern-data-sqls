SELECT  distinct [actiontypecode], year(CONVERT(DATE, [sourceactivitytimedevice])) as year, 
month(CONVERT(DATE, [sourceactivitytimedevice])) as month, 
day(CONVERT(DATE, [sourceactivitytimedevice])) as day, count(1) as ROW_COUNT

  FROM [dbo].[Activity_Raw] aa
  inner join [dbo].[Consumer] bb
  on aa.consumerid = bb.id
  where POWER(convert(bigint, 2), 490 % 63) & TagGroup8Flags > 0 and cast([sourceactivitytimedevice] as date) >= '2018-02-01'
  group by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice])) , 
  day(CONVERT(DATE, [sourceactivitytimedevice])),[actiontypecode]
  
  order by year(CONVERT(DATE, [sourceactivitytimedevice])), 
  month(CONVERT(DATE, [sourceactivitytimedevice])) , 
  day(CONVERT(DATE, [sourceactivitytimedevice])),[actiontypecode]

