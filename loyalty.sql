

-----------CUSTOMER ACTIVATED IN LAST 7DAYS------------------

SELECT 
NULL AS RemoveTag,
'Customer_NOT_burned_reward_in_last_0_to_7_day' AS AddTag,
[ConsumerGuid]
FROM(
SELECT 
	[ConsumerGuid], 
	SUM(CASE WHEN [PointsRequested] > 0 THEN [PointsRequested] ELSE 0 END) AS EarnedRewards,
	SUM(CASE WHEN [PointsRequested] < 0 THEN [PointsRequested] ELSE 0 END) AS BurnedRewards
FROM [LoyaltyCardPointTransaction]
WHERE cast(daterequested as date) >= DATEADD (d, -8, getdate())
GROUP BY [ConsumerGuid]
)t
WHERE BurnedRewards = 0;


-----------CUSTOMER ACTIVATED IN LAST 30 DAYS------------------

SELECT 
NULL AS RemoveTag,
'Customer_NOT_burned_reward_in_last_8_to_30_day' AS AddTag,
[ConsumerGuid]
FROM(
SELECT 
	[ConsumerGuid], 
	SUM(CASE WHEN [PointsRequested] > 0 THEN [PointsRequested] ELSE 0 END) AS EarnedRewards,
	SUM(CASE WHEN [PointsRequested] < 0 THEN [PointsRequested] ELSE 0 END) AS BurnedRewards
FROM [LoyaltyCardPointTransaction]
WHERE cast(daterequested as date) <= DATEADD( d, -8 ,getdate())  
AND cast(daterequested as date) >= DATEADD (d, -30, getdate())
GROUP BY [ConsumerGuid]
)t
WHERE BurnedRewards =0

------------CUSTOMER ACTIVATED IN LAST 60 DAYS-------------------

SELECT 
NULL AS RemoveTag,
'Customer_NOT_burned_reward_in_last_31_to_60_day' AS AddTag,
[ConsumerGuid]
FROM(
SELECT 
	[ConsumerGuid], 
	SUM(CASE WHEN [PointsRequested] > 0 THEN [PointsRequested] ELSE 0 END) AS EarnedRewards,
	SUM(CASE WHEN [PointsRequested] < 0 THEN [PointsRequested] ELSE 0 END) AS BurnedRewards
FROM [LoyaltyCardPointTransaction]
WHERE cast(daterequested as date) <= DATEADD (d, -31, getdate())
AND cast(daterequested as date) >= DATEADD (d, -60, getdate())
GROUP BY [ConsumerGuid]
)t
WHERE BurnedRewards =0

------------CUSTOMER ACTIVATED IN LAST 90 DAYS-------------------
SELECT 
NULL AS RemoveTag,
'Customer_NOT_burned_reward_in_last_61_to_90_day' AS AddTag,
[ConsumerGuid]
FROM(
	SELECT 
		[ConsumerGuid], 
		SUM(CASE WHEN [PointsRequested] > 0 THEN [PointsRequested] ELSE 0 END) AS EarnedRewards,
		SUM(CASE WHEN [PointsRequested] < 0 THEN [PointsRequested] ELSE 0 END) AS BurnedRewards
	FROM [LoyaltyCardPointTransaction]
	WHERE cast(daterequested as date) <= DATEADD (d, -61, getdate())
	AND cast(daterequested as date) >= DATEADD (d, -90, getdate())
	GROUP BY [ConsumerGuid]
)t
WHERE BurnedRewards = 0
