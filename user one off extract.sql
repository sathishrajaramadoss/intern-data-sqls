
select Emailaddress,
		(CASE WHEN (not(POWER(convert(bigint, 2), 40 % 63) & TagGroup1Flags  > 0) and not(POWER(convert(bigint, 2), 42 % 63) & TagGroup1Flags  > 0)and not(POWER(convert(bigint, 2), 45 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_30days, --Not Opened app in the past 0 to 30 days
        (CASE WHEN (not(POWER(convert(bigint, 2), 43 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_60days, --Not Opened app in the past 30 to 60 days
		(CASE WHEN (not(POWER(convert(bigint, 2), 44 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_90days, --Not Opened app in the past 61 to 90 days
		(CASE WHEN (not(POWER(convert(bigint, 2), 46 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_more_then_90days --Not Opened app in the past 91 to 180 days
		from consumer
where POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0
and Emailaddress <> '';

/**************************************************/

select Emailaddress,
		(CASE WHEN (not(POWER(convert(bigint, 2), 40 % 63) & TagGroup1Flags  > 0 and POWER(convert(bigint, 2), 42 % 63) & TagGroup1Flags  > 0 and POWER(convert(bigint, 2), 45 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_30days, --Not Opened app in the past 0 to 30 days
        (CASE WHEN (not(POWER(convert(bigint, 2), 43 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_60days, --Not Opened app in the past 30 to 60 days
		(CASE WHEN (not(POWER(convert(bigint, 2), 44 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_90days, --Not Opened app in the past 61 to 90 days
		(CASE WHEN (not(POWER(convert(bigint, 2), 46 % 63) & TagGroup1Flags  > 0)) THEN 'Yes' ELSE 'No' END) as App_Not_Opened_more_then_90days --Not Opened app in the past 91 to 180 days
		from consumer
where POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0
and Emailaddress <> '';
		

select * from [dbo].[Merchant_Lookup]
 where merchantcountry ='kuwait'

 select * from tagvalue 
 where referencecode like '%opened%'
