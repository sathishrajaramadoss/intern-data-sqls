DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME
SET  @STARTDATE ='06-26-2018'
SET  @ENDDATE = '07-26-2018'

SELECT  count(distinct aa.consumer_id) as Device_Active_Redeemers
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
and aa.app_startup>0 
and aa.consumer_id in (SELECT Id FROM dbo.Consumer WHERE POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and (convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
and aa.consumer_id is not NULL)
and convert(varchar(100),bb.source_activity_date_device,101) between @STARTDATE and @ENDDATE
and aa.consumer_id is not NULL