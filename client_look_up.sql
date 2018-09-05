/*DATE AGGREGATED*/
/*TOTAL EMAIL*/

DECLARE @start_date_time datetime -- for logging --
DECLARE @end_date_time   datetime -- for logging --

SET @start_date_time = cast(getdate() as datetime);
SELECT count(id) as Reg_Email_Users
     FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>''
	 and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
	 and [CreationDate] between @start_date_time and @end_date_time
SET @end_date_time = cast(getdate() as datetime)


/*TOTAL ACTIVE EMAIL*/

SELECT count(distinct consumer_id) as Reg_Email_Active_Users
    FROM dbo.Activity_App
    WHERE app_startup >0
        and consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
		and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE()))
		and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())


/*TOTAL IN-ACTIVE EMAIL*/
select count(distinct id) as Reg_Email_Inactive_Users
from dbo.Consumer 
where EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
and id not in (
	select distinct consumer_id from Activity_app where app_startup>0 
	and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
	and consumer_id is not null)

/** Redeemers Registered Email Active-USERS **/

SELECT  count(distinct bb.consumer_id) as Redmeers_Active_Users_Email
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
and aa.app_startup>0 
and bb.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE()))
and convert(varchar(100),bb.source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
--483,579


/** Non-Redeemers Registered Email Active-USERS **/

SELECT  count(distinct bb.consumer_id) as Non_Redmeers_Active_Users_Email
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id
WHERE offer_redemption=0 and app_startup>0
and bb.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>''
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE()))
and convert(varchar(100),bb.source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
--840,380


/** Redeemers Registered Email Active-USERS **/

select count(distinct id) as Redmeers_InActive_Users
from dbo.Consumer 
where EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
and id not in (
	select distinct consumer_id from Activity_Offer where [offer_redemption]>0 
	and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
	and consumer_id is not null)
and id not in (
	select distinct consumer_id from Activity_App where app_startup>0 
	and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
	and consumer_id is not null)
--290,680


/*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/

/* Total Downloads/Device Registration */

select count(distinct id) as DDR_Total from consumer
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) >= DATEADD(month,-1,GETDATE())
--2,206,456

/* DDR_Active */

SELECT count(distinct consumer_id) as DDR_Active_Users
    FROM dbo.Activity_App
    WHERE app_startup >0
		and consumer_id in (select id from consumer 
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) >= DATEADD(month,-1,GETDATE()))
and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
--1,893,516


/* DDR_In-active */
with #temp as
(
select count(distinct id) as DDR_Total from consumer
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) >= DATEADD(month,-1,GETDATE())
) ,
#temp2 as
(
SELECT count(distinct consumer_id) as DDR_Active_Users
    FROM dbo.Activity_App
    WHERE app_startup >0
		and consumer_id in (select id from consumer 
where POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate) >= DATEADD(month,-1,GETDATE()))
and convert(varchar(100),source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
)
select (DDR_Total - DDR_Active_Users) as DDR_Inactive_Users	
from #temp, #temp2
---312,946


/** Redeemers DDR_Active-USERS **/

SELECT  count(distinct aa.consumer_id) as RDDR_Active_Users
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption>0 
and aa.app_startup>0 
and aa.consumer_id in (SELECT Id FROM dbo.Consumer WHERE POWER(convert(bigint, 2), 62 % 63) & TagGroup1Flags > 0
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
and aa.consumer_id is not NULL)
and convert(varchar(100),bb.source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
and aa.consumer_id is not NULL
--483,034

/** Non-Redeemers DDR_Active-USERS **/

SELECT  count(distinct aa.consumer_id) as NRDDR_Active_Users
FROM dbo.Activity_App as aa
inner join Activity_Offer as bb
on aa.consumer_id=bb.consumer_id    
WHERE bb.offer_redemption=0 
and aa.app_startup>0 
and aa.consumer_id in (SELECT Id FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>'' 
and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
and aa.consumer_id is not NULL)
and convert(varchar(100),bb.source_activity_date_device,101) >= DATEADD(month,-1,GETDATE())
and aa.consumer_id is not NULL
--854,686

/** KPI's **/

select sum(CumulativeAppStartups) as App_start_up,
		sum(CumulativeAdvertisementImpressions) as Adv_Impressions,
		sum(CumulativeAdvertisementClicks) as Adv_Clicks,
		sum(CumulativeOfferImpressions) as Offer_Impressions,
		sum(CumulativeOfferClickThroughs) as Offer_Clicks,
		sum(CumulativeOfferRedemptions) as Offer_Redemptions,
		sum(CumulativeOfferInstoreRedemptions) as Offer_Instore_Redemptions,
		sum(CumulativePushMessagesSent) as Push_Msg_Sent,
		sum(CumulativePushMessageSeen) as Push_Msg_Seen,
		sum(CumulativePushMessageClicked) as Push_Msg_Clicked,
		sum(CumulativeLoyaltyCardImpressions) as Loyalty_Card_Impressions,
		sum(CumulativeLoyaltyCardInstancesActivated) as Loyalty_Card_Instance_Activated,
		sum(CumulativeLoyaltyCardPointsCreated) as Loyalty_Card_Points_Created,
		sum(CumulativeLoyaltyCardRewardsActivated) as Loyalty_Card_Rewards_Activated,
		sum(CumulativeAppPageImpressions) as App_Page_Impressions,
		sum(CumulativeButtonClicks) as Button_Clicks
from report.reporting
where [OccurredOn] >= DATEADD(month,-1,GETDATE());


/**$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$**/


/** Total Migrated Users, Non-Converted Migrated Users & Migrated Users Logged-In **/

select sum((CASE WHEN (Metric = 'MigratedUsers') THEN value END)) AS Total_Migrated_Users,
sum((CASE WHEN (Metric = 'NonConvertedUsers') THEN value END)) AS Non_Converted_Migrated_Users,
sum((CASE WHEN (Metric = 'MigratedUsersLoggedIn') THEN value END)) AS Migrated_Users_Logged_In
from [report].[migrated]


DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME

SET @STARTDATE ='06-26-2018'
SET @ENDDATE =  '07-26-2018';
with #temp as
(
select count(id) from consumer
where convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE
