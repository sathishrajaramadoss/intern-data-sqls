SELECT 
	Id,
	CASE 
		when (POWER(convert(bigint, 2), 562 % 63) & Taggroup9Flags > 0) then '0-14'
		when (POWER(convert(bigint, 2), 563 % 63) & Taggroup9Flags > 0) then '15-17'
		when (POWER(convert(bigint, 2), 564 % 63) & Taggroup9Flags > 0) then '18-29'
		when (POWER(convert(bigint, 2), 565 % 63) & Taggroup9Flags > 0) then '30-34'
		when (POWER(convert(bigint, 2), 13 % 63) & Taggroup1Flags > 0)  then '35-44'
		when (POWER(convert(bigint, 2), 14 % 63) & Taggroup1Flags > 0)  then '45-54'
		when (POWER(convert(bigint, 2), 566 % 63) & Taggroup9Flags > 0) then '55-64'
		when (POWER(convert(bigint, 2), 567 % 63) & Taggroup10Flags > 0)then '65+'
	ELSE NULL END AS Age,
	CASE
		WHEN (POWER(convert(bigint, 2), 39 % 63) & Taggroup1Flags > 0) then 'Female Customers'
		WHEN (POWER(convert(bigint, 2), 38 % 63) & Taggroup1Flags > 0) then 'Male Customers'
	ELSE NULL END AS Gender,
	CASE 
		when POWER(convert(bigint, 2), 305 % 63) & TagGroup5Flags > 0 then 'Beef Lover'  --Beef Lover Preference category
		when POWER(convert(bigint, 2), 304 % 63) & TagGroup5Flags > 0 then 'Beef Regular' --Beef Regular Preference category
		when POWER(convert(bigint, 2), 319 % 63) & TagGroup6Flags > 0 then 'Breakfast Lover' --Breakfast Lover Preference category
		when POWER(convert(bigint, 2), 318 % 63) & TagGroup6Flags > 0 then 'Breakfast Regular' --Breakfast Regular Preference category
		when POWER(convert(bigint, 2), 307 % 63) & TagGroup5Flags > 0 then 'Chicken Lover' --Chicken Lover Preference category
		when POWER(convert(bigint, 2), 306 % 63) & TagGroup5Flags > 0 then 'Chicken Regular' --Chicken Regular Preference category
		when POWER(convert(bigint, 2), 317 % 63) & TagGroup6Flags > 0 then 'Cold Drinks Lover' --Cold Drinks Lover Preference category
		when POWER(convert(bigint, 2), 316 % 63) & TagGroup6Flags > 0 then 'Cold Drinks Regular' --Cold Drinks Regular Preference category
		when POWER(convert(bigint, 2), 325 % 63) & TagGroup6Flags > 0 then 'Customer CHOICE Lover' --Customer CHOICE Lover Preference category
		when POWER(convert(bigint, 2), 324 % 63) & TagGroup6Flags > 0 then 'Customer CHOICE Regular' --'Customer CHOICE Regular Preference category
		when POWER(convert(bigint, 2), 313 % 63) & TagGroup5Flags > 0 then 'Desserts Lover' --Desserts Lover Preference category
		when POWER(convert(bigint, 2), 312 % 63) & TagGroup5Flags > 0 then 'Desserts Regular' --Desserts Regular Preference category
		when POWER(convert(bigint, 2), 329 % 63) & TagGroup6Flags > 0 then 'Fish Lover' --Fish Lover Preference category
		when POWER(convert(bigint, 2), 328 % 63) & TagGroup6Flags > 0 then 'Fish Regular' --Fish Regular Preference category
		when POWER(convert(bigint, 2), 309 % 63) & TagGroup5Flags > 0 then 'Happy Meal Family Lover' --Happy Meal Family Lover Preference category
		when POWER(convert(bigint, 2), 308 % 63) & TagGroup5Flags > 0 then 'Happy Meal Family Regular' --Happy Meal Family Regular Preference category
		when POWER(convert(bigint, 2), 315 % 63) & TagGroup6Flags > 0 then 'Hot Drinks Lover' --Hot Drinks Lover Preference category
		when POWER(convert(bigint, 2), 314 % 63) & TagGroup5Flags > 0 then 'Hot Drinks Regular' --Hot Drinks Regular Preference category
		when POWER(convert(bigint, 2), 331 % 63) & TagGroup6Flags > 0 then 'McCafe Lover' --McCafe Lover Preference category
		when POWER(convert(bigint, 2), 330 % 63) & TagGroup6Flags > 0 then 'McCafe Regular' --McCafe Regular Preference category
		when POWER(convert(bigint, 2), 323 % 63) & TagGroup6Flags > 0 then 'MULTIProduct Lover' --MULTIProduct Lover Preference category
		when POWER(convert(bigint, 2), 322 % 63) & TagGroup6Flags > 0 then 'MULTIProduct Regular' --MULTIProduct Regular Preference category
		when POWER(convert(bigint, 2), 321 % 63) & TagGroup6Flags > 0 then 'Salads Lover' --Salads Lover Preference category
		when POWER(convert(bigint, 2), 320 % 63) & TagGroup6Flags > 0 then 'Salads Regular' --Salads Regular Preference category
		when POWER(convert(bigint, 2), 311 % 63) & TagGroup5Flags > 0 then 'Sides Appetisers Lover' --Sides Appetisers Lover Preference category
		when POWER(convert(bigint, 2), 310 % 63) & TagGroup5Flags > 0 then 'Sides Appetisers Regular' --Sides Appetisers Regular Preference category
		when POWER(convert(bigint, 2), 327 % 63) & TagGroup6Flags > 0 then 'Vegetarian Lover' --Vegetarian Lover Preference category
		when POWER(convert(bigint, 2), 326 % 63) & TagGroup6Flags > 0 then 'Vegetarian Regular' --Vegetarian Regular Preference category
		when (POWER(convert(bigint,2), 368 % 63) & TagGroup6Flags > 0 and POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags > 0) then 'No Preference' --No Preference for Swiss
     ELSE NULL END AS Category_Preference,
	 CASE
		WHEN (POWER(convert(bigint, 2), 207 % 63) & Taggroup4Flags > 0) then 'Registration interval 0-30 days'
		WHEN (POWER(convert(bigint, 2), 216 % 63) & Taggroup4Flags > 0) then 'Registration interval 31-60 days'
		WHEN (POWER(convert(bigint, 2), 217 % 63) & Taggroup4Flags > 0) then 'Registration interval 61-90 days'
		WHEN ((POWER(convert(bigint, 2), 218 % 63) & Taggroup4Flags > 0) OR 
		 (POWER(convert(bigint, 2), 219 % 63) & Taggroup4Flags > 0) OR 
		 (POWER(convert(bigint, 2), 220 % 63) & Taggroup4Flags > 0) OR
		 (POWER(convert(bigint, 2), 221 % 63) & Taggroup4Flags > 0)) then 'Registration interval 91+ days'
	ELSE NULL END as Days_Registered
INTO crm.Report_90c_Boerie_and_cappuccino
FROM Consumer
WHERE (POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0) --South Africa
AND emailaddress is not null and emailaddress <>''
AND ID IN (
	select distinct [consumer_id] from [dbo].[Activity_Offer]
	where [offer_id] IN (4387,3816,4181)
	and offer_redemption >0
)

SELECT distinct Gender, count(1) as row_count 
FROM crm.Report_90c_Boerie_and_cappuccino
group by Gender


select top 100 * from crm.Report_90c_Boerie_and_cappuccino





select * from [dbo].[Offer]
where MerchantId = 602 
and Title like '%boerie%';


where offer_id = 1350;


select * from [crm].[Report_Cappuccino90]