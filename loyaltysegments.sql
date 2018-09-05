
ALTER PROC [tag].[loyaltyrewardsegments] AS
BEGIN

INSERT INTO tag.loyaltysegments
SELECT *  FROM (
SELECT 
	CASE
	when (POWER(convert(bigint, 2), 677 % 63) & Taggroup11Flags > 0) then 'gr_bottom_burner_66_100'
	when (POWER(convert(bigint, 2), 674 % 63) & Taggroup11Flags > 0) then 'gr_bottom_earner_66_100'
	when (POWER(convert(bigint, 2), 676 % 63) & Taggroup11Flags > 0) then 'gr_middle_burner_33_66'
	when (POWER(convert(bigint, 2), 673 % 63) & Taggroup11Flags > 0) then 'gr_middle_earner_33_66'
	when (POWER(convert(bigint, 2), 675 % 63) & Taggroup11Flags > 0) then 'gr_top_burner_top33'
	when (POWER(convert(bigint, 2), 672 % 63) & Taggroup11Flags > 0) then 'gr_top_earner_top33'
	ELSE NULL END AS 'RemoveTag',
	NULL AS 'AddTag',
	Id,
	cast(getdate() as date) as runid
FROM CONSUMER
where POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 
) t
WHERE RemoveTag IS NOT NULL;
 


DECLARE @total_burner AS int;

SELECT 
	@total_burner = count(distinct [ConsumerGuid])
FROM (select id from [dbo].[Consumer] where POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 ) aa
inner join [dbo].[LoyaltyCardPointTransaction] bb
on aa.id = bb.[ConsumerGuid]
where PointsAllocated <0;


INSERT INTO tag.loyaltysegments
SELECT 
NULL AS RemoveTag,
seg AS AddTag,
[ConsumerGuid] AS Id,
cast(getdate() as date) as runid
FROM (
	select 
		bb.[ConsumerGuid],
		sum(PointsAllocated) as point_earn,
		ROW_NUMBER() OVER(ORDER BY sum(PointsAllocated) ) AS Row_nr,
		@total_burner as total,
		floor(@total_burner/3) as div,
		case 
			when ROW_NUMBER() OVER(ORDER BY sum(PointsAllocated) )<= floor(@total_burner/3) then 'gr_top_burner_top33' 
			when ROW_NUMBER() OVER(ORDER BY sum(PointsAllocated) )<= floor(@total_burner/3)*2 then 'gr_middle_burner_33_66' 
		else 'gr_bottom_burner_66_100' end as seg
	FROM (
		select id from [dbo].[Consumer] where POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 ) aa
	inner join [dbo].[LoyaltyCardPointTransaction] bb
	on aa.id = bb.[ConsumerGuid]
	where PointsAllocated <0
	group by [ConsumerGuid]
	--order by sum(PointsAllocated);
)t;

END
