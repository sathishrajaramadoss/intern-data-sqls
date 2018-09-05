WITH ExpiryDate AS 
(
     
SELECT 
    CASE  
        WHEN (POWER(convert(bigint, 2), 26 % 63) & Taggroup1Flags > 0) THEN '564'
        WHEN (POWER(convert(bigint, 2), 189 % 63) & Taggroup4Flags > 0) THEN '565'
        WHEN (POWER(convert(bigint, 2), 24 % 63) & Taggroup1Flags > 0) THEN '568'
        WHEN (POWER(convert(bigint, 2), 239 % 63) & Taggroup4Flags > 0) THEN '573'
        WHEN (POWER(convert(bigint, 2), 275 % 63) & Taggroup5Flags > 0) THEN '576'
        WHEN (POWER(convert(bigint, 2), 295 % 63) & Taggroup5Flags > 0) THEN '577'
        WHEN (POWER(convert(bigint, 2), 345 % 63) & Taggroup6Flags > 0) THEN '579'
        WHEN (POWER(convert(bigint, 2), 371 % 63) & Taggroup6Flags > 0) THEN '581'
        WHEN (POWER(convert(bigint, 2), 379 % 63) & Taggroup7Flags > 0) THEN '582'
        WHEN (POWER(convert(bigint, 2), 406 % 63) & Taggroup7Flags > 0) THEN '585'
        WHEN (POWER(convert(bigint, 2), 421 % 63) & Taggroup7Flags > 0) THEN '587'
        WHEN (POWER(convert(bigint, 2), 444 % 63) & Taggroup8Flags > 0) THEN '589'
        WHEN (POWER(convert(bigint, 2), 489 % 63) & Taggroup8Flags > 0) THEN '591'
        WHEN (POWER(convert(bigint, 2), 490 % 63) & Taggroup8Flags > 0) THEN '592'
        WHEN (POWER(convert(bigint, 2), 505 % 63) & Taggroup9Flags > 0) THEN '595'
        WHEN (POWER(convert(bigint, 2), 513 % 63) & Taggroup9Flags > 0) THEN '597'
        WHEN (POWER(convert(bigint, 2), 549 % 63) & Taggroup9Flags > 0) THEN '600'
        WHEN (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) THEN '602'
        WHEN (POWER(convert(bigint, 2), 592 % 63) & Taggroup10Flags > 0) THEN '604'
        WHEN (POWER(convert(bigint, 2), 619 % 63) & Taggroup10Flags > 0) THEN '606'
        WHEN (POWER(convert(bigint, 2), 620 % 63) & Taggroup10Flags > 0) THEN '611'
        WHEN (POWER(convert(bigint, 2), 621 % 63) & Taggroup10Flags > 0) THEN '612'
        WHEN (POWER(convert(bigint, 2), 622 % 63) & Taggroup10Flags > 0) THEN '613'
        WHEN (POWER(convert(bigint, 2), 279 % 63) & Taggroup5Flags > 0) THEN '617'
        WHEN (POWER(convert(bigint, 2), 92 % 63) & Taggroup2Flags > 0) THEN '619'
        WHEN (POWER(convert(bigint, 2), 93 % 63) & Taggroup2Flags > 0) THEN '621'
        WHEN (POWER(convert(bigint, 2), 172 % 63) & Taggroup3Flags > 0) THEN '623'
        WHEN (POWER(convert(bigint, 2), 174 % 63) & Taggroup3Flags > 0) THEN '625'
        WHEN (POWER(convert(bigint, 2), 184 % 63) & Taggroup3Flags > 0) THEN '627'
        WHEN (POWER(convert(bigint, 2), 197 % 63) & Taggroup4Flags > 0) THEN '629'
        WHEN (POWER(convert(bigint, 2), 601 % 63) & Taggroup10Flags > 0) THEN '606'
    ELSE NULL END AS MerchantID,
    Id,
    Username,
    FirstName,
    LastName,bb.*
FROM Consumer aa
inner join ( SELECT
        ConsumerGuid,
        cast(DateRequested as date) as [DateRequested],
        dateadd(day, 365, cast(DateRequested as date)) as [ExpiryDate]
    FROM dbo.LoyaltyCardPointTransaction
    where cast(DateRequested as date) >= '2018-06-01' ) bb
on aa.id = bb.[ConsumerGuid]
where   POWER(convert(bigint, 2), 189 % 63) & Taggroup4Flags > 0
  
),
 ExpiryDateAggregated AS (
    SELECT *,
           CASE WHEN ExpiryDate <= DATEADD(day, 7, getdate()) and ExpiryDate >= cast(getdate() as date) THEN 'GR_Expire_In_7Days' --Will expire in 7 days
                WHEN ExpiryDate >= DATEADD(day, 8, getdate()) and ExpiryDate <= DATEADD(month, 1, getdate())THEN 'GR_Expire_In_Month' --Will expire in a month
                WHEN ExpiryDate >= DATEADD(month, 1,getdate()) and ExpiryDate <=DATEADD(month, 3, getdate()) THEN 'GR_Expire_In_Quarter' --Will expire in a Quarter
                WHEN ExpiryDate > DATEADD(month, 3, getdate())THEN 'GR_Expire_More_Than_Quarter'  --Will expire more than a quarter
                WHEN ExpiryDate < cast(getdate() as date) THEN 'GR_Expired'
				END as [Tag]
    FROM ExpiryDate
)
SELECT Tag, ConsumerGuid as User_count
FROM ExpiryDateAggregated
GROUP BY Tag,ConsumerGuid;

SELECT * FROM TAGVALUE WHERE NAME LIKE '%EXPIRE%'


 when (POWER(convert(bigint, 2), 247 % 63) & Taggroup4Flags > 0) then 'GR_Expired'
when (POWER(convert(bigint, 2), 248 % 63) & Taggroup4Flags > 0) then 'GR_Expire_In_7Days'
when (POWER(convert(bigint, 2), 249 % 63) & Taggroup4Flags > 0) then 'GR_Expire_In_Month'
when (POWER(convert(bigint, 2), 250 % 63) & Taggroup4Flags > 0) then 'GR_Expire_In_Quarter'
when (POWER(convert(bigint, 2), 251 % 63) & Taggroup4Flags > 0) then 'GR_Expire_More_Than_Quarter'


/* RECENT TOP EXPIRY DATE OF CONSUMER GRID*/
SELECT TOP 100 * FROM (

select [ConsumerGuid],cast(DateRequested as date) as [DateRequested],
dateadd(day, 365, cast(DateRequested as date)) as [ExpiryDate] ,
ROW_NUMBER() OVER(PARTITION BY ConsumerGuid ORDER BY dateadd(day, 365, cast(DateRequested as date))) AS RowOrder
from [dbo].[LoyaltyCardPointTransaction]
where cast(DateRequested as date) < cast(getdate() as date)
--order by [ConsumerGuid], [ExpiryDate]desc;
) t
WHERE RowOrder =1 
order by [ConsumerGuid], [ExpiryDate];

/* CUSTOMER POINTS EXPIRY IN 7 DAYS */

select TOP 100 * FROM
(
SELECT [ConsumerGuid],cast(DateRequested as date) as [DateRequested],
dateadd(day, 365, cast(DateRequested as date)) as [ExpiryDate],
ROW_NUMBER() OVER(PARTITION BY ConsumerGuid ORDER BY dateadd(day, 365, cast(DateRequested as date))/*DESC*/) AS RowOrder
from [dbo].[LoyaltyCardPointTransaction]
where dateadd(day, 365, cast(DateRequested as date)) <= DATEADD(day, 7, getdate()) and dateadd(day, 365, cast(DateRequested as date)) >= cast(getdate() as date)
--order by [ConsumerGuid];
)temp
WHERE RowOrder = 1
order by [ConsumerGuid], [ExpiryDate];

/* CUSTOMER POINTS EXPIRY IN A MONTH */

SELECT TOP 100 * FROM
(
SELECT [ConsumerGuid],CAST(DateRequested AS DATE) AS [DateRequested],
DATEADD(DAY, 365, CAST(DateRequested AS DATE)) AS [ExpiryDate],
ROW_NUMBER() OVER(PARTITION BY ConsumerGuid ORDER BY DATEADD(DAY, 365, CAST(DateRequested AS DATE))/*DESC*/) AS RowOrder
FROM [dbo].[LoyaltyCardPointTransaction]
WHERE DATEADD(DAY, 365, CAST(DateRequested AS DATE)) >= DATEADD(DAY, 8, GETDATE()) and DATEADD(DAY, 365, CAST(DateRequested AS DATE)) <= DATEADD(MONTH, 1, GETDATE())
--ORDER BY [ConsumerGuid];
)temp
WHERE RowOrder =1 
ORDER BY [ConsumerGuid], [ExpiryDate];


/* CUSTOMER POINTS EXPIRY IN A QUARTER */

SELECT TOP 100 * FROM
(
SELECT [ConsumerGuid],CAST(DateRequested AS DATE) AS [DateRequested],
DATEADD(DAY, 365, CAST(DateRequested AS DATE)) AS [ExpiryDate],
ROW_NUMBER() OVER(PARTITION BY ConsumerGuid ORDER BY DATEADD(DAY, 365, CAST(DateRequested AS DATE))/*DESC*/) AS RowOrder
FROM [dbo].[LoyaltyCardPointTransaction]
WHERE DATEADD(DAY, 365, CAST(DateRequested AS DATE)) >= DATEADD(MONTH, 1, GETDATE()) and DATEADD(DAY, 365, CAST(DateRequested AS DATE)) <= DATEADD(MONTH, 3, GETDATE())
--ORDER BY [ConsumerGuid];
)temp
WHERE RowOrder =1
ORDER BY [ConsumerGuid], [ExpiryDate];