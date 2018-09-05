
SELECT
[dbo].[Offer].MerchantId, 
[Campaign].Title as Campaign_Title,
[dbo].[Offer].Id as Offer_Id, 
[Offer].Title as Offer_Title,
[Offer].[WhenStarts] as Offer_StartDate,
[Offer].[WhenExpires] as Offer_StartEndDate,
[Category].[Name] as Offer_Category,
CASE WHEN isrespawning = 1 THEN 'Yes' ELSE 'No' End as [Repeatable],
sum([CumulativeOfferImpressions]) as Offer_Impressions,
sum([CumulativeOfferRedemptions]) as Offer_Redemption
from [report].[reporting] 
inner join [dbo].[Offer] on [report].[reporting].[ItemId]=[dbo].[Offer].[Id]
inner join [dbo].[Campaign] on [dbo].[Campaign].[Id]=[dbo].[Offer].[CampaignId]
inner join [dbo].[Category] on [dbo].[Category].[Id]=[dbo].[Offer].[CategoryId]
group by 
[dbo].[Offer].MerchantId, 
[Campaign].Title,
[Offer].Title,
[Offer].[WhenStarts],
[Offer].[WhenExpires],
[Category].[Name],
CASE WHEN isrespawning = 1 THEN 'Yes' ELSE 'No' End
Order by 
[dbo].[Offer].MerchantId, 
[Campaign].Title,
[Offer].Title,
[Offer].[WhenStarts],
[Offer].[WhenExpires],
[Category].[Name],
CASE WHEN isrespawning = 1 THEN 'Yes' ELSE 'No' End