select
count(offer_id) as Instore
from [dbo].[Activity_Offer] aa
inner join consumer bb 
on aa.consumer_id=bb.id
where (POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 ---SW
OR POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 ---SN
OR POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 ---DK
OR POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0) ---PL
and offer_instore_redemption >0---2190276

select count(aa.sale_id) as test from [dbo].[Sale_Detail] aa
left join [dbo].[Sale_Header] bb
on aa.sale_id=bb.sale_id
inner join consumer cc
on bb.consumer_id=cc.id
where (POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 ---SW
OR POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 ---SN
OR POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 ---DK
OR POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0) ---PL
and offerids <> ''
--3817639

select count(offer_id) from [dbo].[Sale_Detail] aa
inner join [dbo].[Sale_Header] bb
on aa.sale_id=bb.sale_id
inner join consumer cc
on bb.consumer_id=cc.id
where (POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 ---SW
OR POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 ---SN
OR POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 ---DK
OR POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0) ---PL


SELECT * FROM OFFER WHERE ID = 4021
SELECT * FROM [report].[tmpreporting] WHERE ITEMID = 4021


select MerchantId,datefromparts(year([OccurredOn]), month([OccurredOn]), 1) as [date], sum([CumulativeOfferInstoreRedemptions]) Instore from [report].[reporting]
where [CumulativeOfferInstoreRedemptions]<>''
and [OccurredOn]>='2018-05-09'
---AND MerchantId in (564,579,582,589)
group by merchantid,datefromparts(year([OccurredOn]), month([OccurredOn]), 1)
order by merchantid,datefromparts(year([OccurredOn]), month([OccurredOn]), 1)

select [MerchantId],datefromparts(year([OccurredOn]), month([OccurredOn]), 1) as [date],sum(TransactionCount) as Transactions from [report].[sales_clr_coupon]
where couponid is NOT null
and merchantid<>''
---and [OccurredOn]>='2018-05-09'
---AND [MerchantId] in (564,579,582,589) 
group by [MerchantId],datefromparts(year([OccurredOn]), month([OccurredOn]), 1)
order by [MerchantId],datefromparts(year([OccurredOn]), month([OccurredOn]), 1)


--340 Sales
select sum(transactioncount) from [report].[tmpsales_clr_coupon] where [MerchantId] is NOT null
and occurredon >= '2018-05-09'
and couponid = '5668'
---1346150

--353 reporting
select sum([CumulativeOfferInstoreRedemptions]) from [report].[tmpreporting]
where occurredon >= '2018-05-09'
and itemid = '5668'
----1166073
--353 activityoffer
select sum([offer_instore_redemption]) from [dbo].[Activity_Offer]
where [source_activity_date_device] >= '20180813'
and [offer_id] = '5668'

--345 redeemedofferactivity
select count(1) from [dbo].[Consumer_RedeemedOfferActivity]
where cast([DateOccured] as date) = '2018-08-13'
and offerid  = '5668'

select top 10 * from Sale_Header