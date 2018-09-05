DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME
SET  @STARTDATE ='06-26-2018'
SET  @ENDDATE = '07-26-2018'
select sum((CASE WHEN (Metric = 'MigratedUsers') THEN value END)) AS Total_Migrated_Users,
sum((CASE WHEN (Metric = 'NonConvertedUsers') THEN value END)) AS Non_Converted_Migrated_Users,
sum((CASE WHEN (Metric = 'MigratedUsersLoggedIn') THEN value END)) AS Migrated_Users_Logged_In
from [report].[migrated]
