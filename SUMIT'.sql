select case
when POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 then 564   -- DK
             when POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 then 565   -- GR
             when POWER(convert(bigint, 2),  24 % 63) & TagGroup1Flags  > 0 then 568   -- SA
             when POWER(convert(bigint, 2), 239 % 63) & TagGroup4Flags  > 0 then 573   -- CR
             when POWER(convert(bigint, 2), 275 % 63) & TagGroup5Flags  > 0 then 576   -- MR
             when POWER(convert(bigint, 2), 295 % 63) & TagGroup5Flags  > 0 then 577   -- JE
             when POWER(convert(bigint, 2), 371 % 63) & TagGroup6Flags  > 0 then 581   -- FL
             when POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 then 579   -- SW
             when POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 then 582   -- SN
             when POWER(convert(bigint, 2), 406 % 63) & TagGroup7Flags  > 0 then 585   -- JN
             when POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 then 589   -- PL
             when POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 then 587   -- IT
             when POWER(convert(bigint, 2), 489 % 63) & TagGroup8Flags  > 0 then 591   -- HU
             when POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0 then 595   -- KU
             when POWER(convert(bigint, 2), 490 % 63) & TagGroup8Flags  > 0 then 592   -- NZ
             when POWER(convert(bigint, 2), 513 % 63) & TagGroup9Flags  > 0 then 597   -- PK
             when POWER(convert(bigint, 2), 549 % 63) & Taggroup9Flags  > 0 then 600   -- BF
             when POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0 then 602   -- ZA
             when POWER(convert(bigint, 2), 592 % 63) & Taggroup10Flags > 0 then 604   -- QA
             when POWER(convert(bigint, 2), 619 % 63) & Taggroup10Flags > 0 then 606   -- TR
             when POWER(convert(bigint, 2), 620 % 63) & Taggroup10Flags > 0 then 611   -- ES
             when POWER(convert(bigint, 2), 621 % 63) & Taggroup10Flags > 0 then 612   -- LA
             when POWER(convert(bigint, 2), 622 % 63) & Taggroup10Flags > 0 then 613   -- LI
             when POWER(convert(bigint, 2), 279 % 63) & Taggroup5Flags  > 0 then 617   -- MY
             when POWER(convert(bigint, 2),  93 % 63) & Taggroup2Flags  > 0 then 621   -- ON
             when POWER(convert(bigint, 2), 184 % 63) & Taggroup3Flags  > 0 then 627   -- GR
             when POWER(convert(bigint, 2),  92 % 63) & Taggroup2Flags  > 0 then 619   -- GT
             when POWER(convert(bigint, 2), 172 % 63) & Taggroup3Flags  > 0 then 623   -- UE
             when POWER(convert(bigint, 2), 174 % 63) & Taggroup3Flags  > 0 then 625   -- BN
             when POWER(convert(bigint, 2), 197 % 63) & Taggroup4Flags  > 0 then 629   -- SV
             when POWER(convert(bigint, 2), 665 % 63) & Taggroup11Flags > 0 then 631   -- HN
             when POWER(convert(bigint, 2), 666 % 63) & Taggroup11Flags > 0 then 634   -- NI
             when POWER(convert(bigint, 2), 713 % 63) & Taggroup12Flags > 0 then 636   -- EG
             end as 'merchantid',
			 count(CASE WHEN (POWER(convert(bigint, 2),309 % 63) & TagGroup5Flags > 0) THEN id END) as High_Redmeption,
			 count(CASE WHEN (POWER(convert(bigint, 2),308 % 63) & TagGroup5Flags > 0) THEN id END) as Low_Redmeption  
from consumer
group by case
             when POWER(convert(bigint, 2),  26 % 63) & TagGroup1Flags  > 0 then 564   -- DK
             when POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0 then 565   -- GR
             when POWER(convert(bigint, 2),  24 % 63) & TagGroup1Flags  > 0 then 568   -- SA
             when POWER(convert(bigint, 2), 239 % 63) & TagGroup4Flags  > 0 then 573   -- CR
             when POWER(convert(bigint, 2), 275 % 63) & TagGroup5Flags  > 0 then 576   -- MR
             when POWER(convert(bigint, 2), 295 % 63) & TagGroup5Flags  > 0 then 577   -- JE
             when POWER(convert(bigint, 2), 371 % 63) & TagGroup6Flags  > 0 then 581   -- FL
             when POWER(convert(bigint, 2), 345 % 63) & TagGroup6Flags  > 0 then 579   -- SW
             when POWER(convert(bigint, 2), 379 % 63) & TagGroup7Flags  > 0 then 582   -- SN
             when POWER(convert(bigint, 2), 406 % 63) & TagGroup7Flags  > 0 then 585   -- JN
             when POWER(convert(bigint, 2), 444 % 63) & TagGroup8Flags  > 0 then 589   -- PL
             when POWER(convert(bigint, 2), 421 % 63) & TagGroup7Flags  > 0 then 587   -- IT
             when POWER(convert(bigint, 2), 489 % 63) & TagGroup8Flags  > 0 then 591   -- HU
             when POWER(convert(bigint, 2), 505 % 63) & TagGroup9Flags  > 0 then 595   -- KU
             when POWER(convert(bigint, 2), 490 % 63) & TagGroup8Flags  > 0 then 592   -- NZ
             when POWER(convert(bigint, 2), 513 % 63) & TagGroup9Flags  > 0 then 597   -- PK
             when POWER(convert(bigint, 2), 549 % 63) & Taggroup9Flags  > 0 then 600   -- BF
             when POWER(convert(bigint, 2), 578 % 63) & Taggroup10Flags > 0 then 602   -- ZA
             when POWER(convert(bigint, 2), 592 % 63) & Taggroup10Flags > 0 then 604   -- QA
             when POWER(convert(bigint, 2), 619 % 63) & Taggroup10Flags > 0 then 606   -- TR
             when POWER(convert(bigint, 2), 620 % 63) & Taggroup10Flags > 0 then 611   -- ES
             when POWER(convert(bigint, 2), 621 % 63) & Taggroup10Flags > 0 then 612   -- LA
             when POWER(convert(bigint, 2), 622 % 63) & Taggroup10Flags > 0 then 613   -- LI
             when POWER(convert(bigint, 2), 279 % 63) & Taggroup5Flags  > 0 then 617   -- MY
             when POWER(convert(bigint, 2),  93 % 63) & Taggroup2Flags  > 0 then 621   -- ON
             when POWER(convert(bigint, 2), 184 % 63) & Taggroup3Flags  > 0 then 627   -- GR
             when POWER(convert(bigint, 2),  92 % 63) & Taggroup2Flags  > 0 then 619   -- GT
             when POWER(convert(bigint, 2), 172 % 63) & Taggroup3Flags  > 0 then 623   -- UE
             when POWER(convert(bigint, 2), 174 % 63) & Taggroup3Flags  > 0 then 625   -- BN
             when POWER(convert(bigint, 2), 197 % 63) & Taggroup4Flags  > 0 then 629   -- SV
             when POWER(convert(bigint, 2), 665 % 63) & Taggroup11Flags > 0 then 631   -- HN
             when POWER(convert(bigint, 2), 666 % 63) & Taggroup11Flags > 0 then 634   -- NI
             when POWER(convert(bigint, 2), 713 % 63) & Taggroup12Flags > 0 then 636   -- EG
             end
order by merchantid
