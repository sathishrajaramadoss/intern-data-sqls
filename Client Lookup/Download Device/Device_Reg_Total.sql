DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME
SET  @STARTDATE ='06-26-2018'
SET  @ENDDATE = '07-26-2018'
select count(distinct id) as Device_Reg_Total from consumer
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) between @STARTDATE and @ENDDATE