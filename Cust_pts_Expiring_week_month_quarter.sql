-----------Customer points expiring in a week, month and quarter---------------

WITH ExpiryDate AS (
    SELECT
        ConsumerGuid,
        cast(DateRequested as date) as [DateRequested],
        dateadd(day, 365, cast(DateRequested as date)) as [ExpiryDate]
    FROM dbo.LoyaltyCardPointTransaction
), ExpiryDateAggregated AS (
    SELECT *,
           CASE WHEN ExpiryDate < cast(getdate() as date) THEN 'Expired'
                WHEN ExpiryDate <= DATEADD(day, 7, getdate()) and ExpiryDate >= cast(getdate() as date) THEN 'Will expire in 7 days'
                WHEN ExpiryDate >= DATEADD(day, 8, getdate()) and ExpiryDate <= DATEADD(month, 1,getdate()) THEN 'Will expire in a month'
			  /*WHEN ExpiryDate >= cast(getdate() + 8 as date) and ExpiryDate <= DATEADD(month, 1, getdate())THEN 'Will expire in a month'*/
                WHEN ExpiryDate >= DATEADD(month, 1,getdate()) and ExpiryDate <=DATEADD(month, 3, getdate()) THEN 'Will expire in a Quarter'
                WHEN ExpiryDate > DATEADD(month, 3, getdate())THEN 'Will expire after quarter'
                END as [Tag]
    FROM ExpiryDate
)
SELECT Tag, count(distinct ConsumerGuid) as User_count
FROM ExpiryDateAggregated
GROUP
 BY Tag

 