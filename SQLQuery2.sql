DECLARE   @STARTDATE DATETIME,
                @ENDDATE DATETIME

SET           @STARTDATE ='06-26-2018'
SET           @ENDDATE =  '07-26-2018'

SELECT count(id) as Reg_Email_Users
     FROM dbo.Consumer WHERE EmailAddress is not null and EmailAddress<>''
	 --and convert(varchar(100),creationdate,101) >= DATEADD(month,-1,GETDATE())
	 and convert(varchar(100),creationdate,101) between @STARTDATE and @ENDDATE