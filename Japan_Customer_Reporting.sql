/******************************
** File: Barista_Sathish.sql
** Name: 
** Desc: 
** Auth: 
** Date: 2018/06/17
*******************************/

/******************************
** COUPON REDEMPTION
*******************************/

DECLARE @itemid INT = 10732

SELECT TOP 10 *
FROM [dbo].[Activity_Offer] AS ACT
WHERE ACT.offer_id = @itemid  --Offer Id
      AND ACT.offer_redemption != 0  --Coupon redemption
------
------CREATE A JOIN BETWEEN THE OFFER ACTIVITY AND THE USER TABLE
------



SELECT offer_id, COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 345 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Hokkaido],
       COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 372 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Aomori],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 373 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Iwate],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 374 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Miyagi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 375 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Akita],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 376 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Yamagata],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 377 % 63) & Taggroup6Flags > 0) THEN Id END)) AS [Fukushima],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 378 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Ibaraki],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 379 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Tochigi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 380 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Gunma],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 381 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Saitama],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 382 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Chiba],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 383 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Tokyo],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 384 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kanagawa],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 385 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Niigata],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 386 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Toyama],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 387 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Ishikawa],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 388 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Fukui],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 389 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Yamanashi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 390 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Nagano],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 391 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Gifu],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 392 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Shizuoka],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 393 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Aichi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 394 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Mie],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 395 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Shiga],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 396 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kyoto],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 397 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Osaka],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 398 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Hyogo],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 399 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Nara],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 400 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Wakayama],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 401 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Tottori],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 402 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Shimane],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 403 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Okayama],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 404 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Hiroshima],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 405 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Yamaguchi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 406 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Tokushima],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 407 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kagawa],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 408 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Ehime],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 409 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kochi],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 410 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Fukuoka],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 411 % 63) & TagGroup7Flags > 0) THEN Id END)) AS [Saga],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 412 % 63) & TagGroup7Flags > 0) THEN Id END)) AS [Nagasaki],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 413 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kumamoto],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 414 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Oita],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 415 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Miyazaki],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 416 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Kagoshima],
	   COUNT(DISTINCT(CASE WHEN (POWER(CONVERT(BIGINT, 2), 417 % 63) & Taggroup7Flags > 0) THEN Id END)) AS [Okinawa],
	   count(DISTINCT Id) as allz
FROM [dbo].[Consumer] aa
inner join [dbo].[Activity_Offer] bb 
on aa.id=bb.consumer_id
where offer_id IN (10732)
group by offer_id

