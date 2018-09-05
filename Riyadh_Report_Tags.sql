/**  List of email users, thier first name, last name, email address Gender DOB if available mapped to following: **/
--- App not opened in last 30 days and made 0 redemption in last 30 days 

 SELECT FirstName,LastName,EmailAddress,Gender,DateOfBirth
FROM [dbo].[Consumer]
where (POWER(convert(bigint, 2),  24 % 63) & Taggroup1Flags> 0 ) -- Riyadh
and NOT((POWER(convert(bigint, 2),  40 % 63) & Taggroup1Flags> 0 )--Last Opened app in 0 to 1 day
or (POWER(convert(bigint, 2),  42 % 63) & Taggroup1Flags> 0 )--Last Opened app in 2 to 7 days
or (POWER(convert(bigint, 2),  45 % 63) & Taggroup1Flags> 0 ))--Last Opened app in 8 to 30 days
and (POWER(convert(bigint, 2), 225 % 63) & TagGroup4Flags > 0)--Redeemed Offer 0 times in last 30 days
and emailaddress is not null and emailaddress <>''
--279071

---App not opened in last 60 days and made 0 redemption in last 60 days 

SELECT FirstName,LastName,EmailAddress,Gender,DateOfBirth
FROM [dbo].[Consumer]
where (POWER(convert(bigint, 2),  24 % 63) & Taggroup1Flags> 0 ) -- Riyadh
and NOT((POWER(convert(bigint, 2),  40 % 63) & Taggroup1Flags> 0 )--Last Opened app in 0 to 1 day
or (POWER(convert(bigint, 2),  42 % 63) & Taggroup1Flags> 0 )--Last Opened app in 2 to 7 days
or (POWER(convert(bigint, 2),  45 % 63) & Taggroup1Flags> 0 )--Last Opened app in 8 to 30 days
or (POWER(convert(bigint, 2),  43 % 63) & Taggroup1Flags> 0 ))--Last Opened app in 31 to 60 days
and (POWER(convert(bigint, 2), 226 % 63) & TagGroup4Flags > 0)--Redeemed Offer 0 times in last 60 days
and emailaddress is not null and emailaddress <>''
--253177

---App not opened in last 90 days and made 0 redemption in last 90 days 

SELECT FirstName,LastName,EmailAddress,Gender,DateOfBirth
FROM [dbo].[Consumer] aa
where (POWER(convert(bigint, 2),  24 % 63) & Taggroup1Flags> 0 ) -- Riyadh
and NOT((POWER(convert(bigint, 2),  40 % 63) & Taggroup1Flags> 0 )--Last Opened app in 0 to 1 day
or (POWER(convert(bigint, 2),  42 % 63) & Taggroup1Flags> 0 )--Last Opened app in 2 to 7 days
or (POWER(convert(bigint, 2),  45 % 63) & Taggroup1Flags> 0 )--Last Opened app in 8 to 30 days
or (POWER(convert(bigint, 2),  43 % 63) & Taggroup1Flags> 0 )--Last Opened app in 31 to 60 days
or (POWER(convert(bigint, 2),  44 % 63) & Taggroup1Flags> 0 ))--Last Opened app in 61 to 90 day
and (POWER(convert(bigint, 2), 227 % 63) & TagGroup4Flags > 0)--Redeemed Offer 0 times in last 90 days
and emailaddress is not null and emailaddress <>''
--206397


