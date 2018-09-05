DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME
SET  @STARTDATE ='06-26-2018'
SET  @ENDDATE = '07-26-2018'
SELECT count(distinct consumer_id) as Device_Reg_Active
    FROM dbo.Activity_App
    WHERE app_startup >0
		and consumer_id in (select id from consumer 
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) between @STARTDATE and @ENDDATE)
and convert(varchar(100),source_activity_date_device,101) between @STARTDATE and @ENDDATE