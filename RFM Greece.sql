
select distinct consumer_id as Customers,
sum(Total_amount)/count(sale_id) as Avg_Trans,
count(sale_id) as Frequency,
max(convert(date,date_occurred)) as Recently
from [Sale_Header] aa
inner join consumer bb 
on aa.[consumer_id]=bb.[Id]
inner join activity_raw cc
on aa.[consumer_id]=cc.consumerid
where convert(varchar(100),date_occurred,101) <= DATEADD(month,6,GETDATE())
and (POWER(convert(bigint, 2), 189 % 63) & TagGroup4Flags  > 0)
group by consumer_id
order by consumer_id
