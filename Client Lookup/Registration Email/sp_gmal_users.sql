ALTER PROC [crm].[spPopulateGMALiteCoach] AS
BEGIN

--------------
-- clean up --
--------------
IF object_id('')  is not null DROP TABLE ;

DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME

SET @STARTDATE ='06-26-2018'
SET @ENDDATE =  '07-26-2018'


--Email Reg Users
SELECT
  convert(varchar(100),creationdate,101) as OccurredOn,
  'Email Reg' as Metric,
  COUNT(id) as UserCount 
INTO #emailreg
FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>''
	 and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE
GROUP BY convert(varchar(100),creationdate,101)

--Unregistered Users
SELECT 
   convert(varchar(100),creationdate,101) as OccurredOn,
  'Unregistered' as Metric,
   COUNT(id) as UserCount 
INTO #unregistered
FROM CONSUMER 
	WHERE LASTKNOWNDEVICEID NOT IN (
		SELECT LASTKNOWNDEVICEID
		FROM dbo.Consumer 
		WHERE EmailAddress is not null and EmailAddress<>'')
	and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE
GROUP BY convert(varchar(100),creationdate,101)


--Active Email
SELECT 
   convert(varchar(100),source_activity_date_device,101) as OccurredOn,
  'Active Email' as Metric,
   count(distinct consumer_id) as UserCount 
INTO #activeemail
FROM dbo.Activity_App 
WHERE app_startup >0
    and consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
	and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
	and convert(varchar(100),source_activity_date_device,101) between @STARTDATE and @ENDDATE
GROUP BY convert(varchar(100),source_activity_date_device,101)


--Inactive Email

SELECT 
   convert(varchar(100),creationdate,101) as OccurredOn,
  'InActive Email' as Metric,
   count(distinct id) as UserCount 
INTO #inactiveemail
from dbo.Consumer 
where EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE
and id not in (
	select distinct consumer_id from Activity_app where app_startup>0 
	and convert(varchar(100),source_activity_date_device,101) between @STARTDATE and @ENDDATE
	and consumer_id is not null)
GROUP BY convert(varchar(100),creationdate,101)

--Redeemers Active
SELECT 
   convert(varchar(100),source_activity_date_device,101) as OccurredOn,
  'Redeemers Active' as Metric,
   count(distinct bb.consumer_id) as UserCount 
INTO #redeemersactive
FROM dbo.Activity_App as aa
	inner join Activity_Offer as bb on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
	and aa.app_startup>0 
	and bb.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
	and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
	and convert(varchar(100),bb.source_activity_date_device,101) between @STARTDATE and @ENDDATE
GROUP BY convert(varchar(100),source_activity_date_device,101)


--Non Redeemers Active
with #temp as
(
SELECT count(distinct consumer_id) as Reg_Email_Active_Users
FROM dbo.Activity_App 
WHERE app_startup >0
    and consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
	and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
	and convert(varchar(100),source_activity_date_device,101) between @STARTDATE and @ENDDATE
) ,
#temp2 as
(
SELECT  count(distinct bb.consumer_id) as Redmeers_Active_Users_Email
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
and aa.app_startup>0 
and bb.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE)
and convert(varchar(100),bb.source_activity_date_device,101) between @STARTDATE and @ENDDATE
)
select (Reg_Email_Active_Users - Redmeers_Active_Users_Email) as Non_Redmeers_Active_Users_Email	
from #temp, #temp2