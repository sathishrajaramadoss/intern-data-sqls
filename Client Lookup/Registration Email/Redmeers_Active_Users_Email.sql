SELECT  count(distinct bb.consumer_id) as Redmeers_Active_Users_Email
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
and aa.app_startup>0 
and bb.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
and convert(varchar(100),bb.source_activity_date_device,101) between @STARTDATE and @ENDDATE