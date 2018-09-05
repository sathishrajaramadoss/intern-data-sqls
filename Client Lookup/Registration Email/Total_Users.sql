DECLARE @STARTDATE DATETIME,
@ENDDATE DATETIME

SET @STARTDATE ='06-26-2018'
SET @ENDDATE =  '07-26-2018'


	 SELECT COUNT(id) as Total_Users FROM CONSUMER 
	 WHERE LASTKNOWNDEVICEID NOT IN (
		SELECT LASTKNOWNDEVICEID
		FROM dbo.Consumer 
		WHERE EmailAddress is not null and EmailAddress<>'')
	 and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE

	 --registered accounts 1435911
	 --unregistered acccounts 1198861