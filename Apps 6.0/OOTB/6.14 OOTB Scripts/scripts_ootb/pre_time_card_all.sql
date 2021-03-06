


/****** M2SI TEST QUERY FOR TIME_CARD******/
 drop TABLE  if exists app_test.temp_time_card_split;
CREATE TABLE app_test.temp_time_card_split 
 (INDEX (SYS_ID,WEEK_STARTS_ON))  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
AS (
select * from (

/************ SUNDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=6 -- week starts on sunday INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 7 day) END AS WEEK_STARTS_ON

,TCD.SUNDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
-- ,TCD.DESCRIPTION -- mapping not known
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD

/************ SUNDAY CODE ENDS HERE ***********/
UNION

/************ MONDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=0 -- week starts on MONDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 
WHEN WEEKDAY(TCD.WEEK_STARTS_ON)=6 
THEN
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 1 day)

ELSE 
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 8 day)

 END AS WEEK_STARTS_ON

,TCD.MONDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ MONDAY CODE ENDS HERE ***********/
UNION
/************ TUESDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=1 -- week starts on TUESDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 

WHEN (WEEKDAY(TCD.WEEK_STARTS_ON)=0 or WEEKDAY(TCD.WEEK_STARTS_ON)=6 )
THEN  date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 2 day)
ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 9 day)

 END AS WEEK_STARTS_ON

,TCD.TUESDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ TUESDAY CODE ENDS HERE ***********/
UNION
/************ WEDNESDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=2 -- week starts on WEDNESDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 

WHEN( WEEKDAY(TCD.WEEK_STARTS_ON)<2 or WEEKDAY(TCD.WEEK_STARTS_ON)=6 )

THEN  date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 3 day)

ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 10 day) END AS WEEK_STARTS_ON

,TCD.WEDNESDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ WEDNESDAY CODE ENDS HERE ***********/
UNION

/************ THURSDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=3 -- week starts on THURSDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 

WHEN (WEEKDAY(TCD.WEEK_STARTS_ON)<3 or WEEKDAY(TCD.WEEK_STARTS_ON)=6 )

THEN  date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 4 day)

ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 11 day)
END AS WEEK_STARTS_ON

,TCD.THURSDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ THURSDAY CODE ENDS HERE ***********/
UNION
/************ FRIDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=4 -- week starts on TUESDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 
WHEN (WEEKDAY(TCD.WEEK_STARTS_ON)<4 or WEEKDAY(TCD.WEEK_STARTS_ON)=6 )

THEN  date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY ,interval 5 day)
ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 12 day)
END AS WEEK_STARTS_ON

,TCD.FRIDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ FRIDAY CODE ENDS HERE ***********/
UNION

/************ SATURDAY CODE STARTS HERE ***********/
SELECT
TCD.CATEGORY
,TCD.SYS_CREATED_ON
,TCD.SYS_CREATED_BY
,TCD.STATE
-- ,TCD.CDCTYPE
,CASE WHEN 
WEEKDAY(TCD.WEEK_STARTS_ON)=5 -- week starts on TUESDAY INDEX 0-MONDAY----6-SUNDAY(DAYOFWEEK-1--SUNDAY.....7-SATURDAY)
THEN TCD.WEEK_STARTS_ON 
WHEN (WEEKDAY(TCD.WEEK_STARTS_ON)<5 or WEEKDAY(TCD.WEEK_STARTS_ON)=6 )

THEN  date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 6 day)
ELSE
-- add 7 days to start of the week to get the following date
date_add(TCD.WEEK_STARTS_ON - INTERVAL((WEEKDAY(TCD.WEEK_STARTS_ON)+1)%7) DAY,interval 13 day)
END AS WEEK_STARTS_ON

,TCD.SATURDAY AS TIME_ENTERED
,TCD.SYS_ID
,TCD.TASK
,TCD.TOTAL
,TCD.SYS_UPDATED_ON
,TCD.SYS_UPDATED_BY
-- ,TCD.UPDATES
,TCD.USER
,TCD.sourceinstance
-- ,TCD.DESCRIPTION -- mapping not known
,TCD.WEEK_STARTS_ON as SRC_WEEK_STARTS_ON
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.time_card_final WHERE CDCTYPE<>'D') TCD
/************ SATURDAY CODE ENDS HERE ***********/
)CONC
);
 drop TABLE  if exists app_test.temp_time_card_final;
CREATE TABLE app_test.temp_time_card_final (INDEX (ROW_ID))  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AS (
select
CONCAT(TCD.SYS_ID,'~',(datediff(TCD.WEEK_STARTS_ON,TCD.SRC_WEEK_STARTS_ON) )+1)AS ROW_ID
,TCD.SYS_ID as timecard_source_id
,TCD.SOURCEINSTANCE AS SOURCE_ID
,CONCAT(coalesce(TCD.USER,'UNSPECIFIED'),'~',coalesce(TCD.TASK,'UNSPECIFIED'),'~',DATE_FORMAT(TCD.WEEK_STARTS_ON,'%Y%m%d')) AS TIMECARD_NUMBER
-- ,ETL_RUN_NUMBER -- TO KNOW THE ETL NUMBER TO VALIDATE THIS COLUMN
,date_format(TCD.WEEK_STARTS_ON,'%Y%m%d') as TIME_CARD_ON_ID
,date_format(TCD.WEEK_STARTS_ON,'%H%i') as TIME_CARD_TIME_ID
 ,TCD.WEEK_STARTS_ON AS TIME_CARD_ON
,CONCAT('INTERNAL_CONTACT~',UPPER(TCD.USER))  AS EMPLOYEE_ID
,CONCAT('DEPARTMENT~',UPPER(SUF.DEPARTMENT)) AS DEPARTMENT_ID
,SUF.LOCATION AS LOCATION_ID
,SUF.COST_CENTER AS COST_CENTER_ID
,SUF.SYS_DOMAIN AS DOMAIN_ID
-- ,CONCAT('TASK~'
,TCD.TASK
-- ) 
AS task_row_id
-- ,CONCAT('PROJECT~',TCD.TASK)  AS PROJECT_ID
,TCD.TASK AS PROJECT_ID
,concat('SUBSIDIARY~',SUF.COMPANY) AS COMPANY_ID -- as per mapping it is core_company
,CONCAT('CATEGORY','~','TIME_CARD','~',UPPER(TCD.CATEGORY )) AS CATEGORY_SRC_CODE_ID
,CONCAT('STATE','~','TIME_CARD','~',UPPER(TCD.STATE )) AS STATE_SRC_CODE_ID
,TCD.CATEGORY AS CATEGORY_SRC_CODE
,TCD.STATE AS STATE_SRC_CODE
,TCD.TIME_ENTERED AS TIME_ENTERED
-- ,TCD.DESCRIPTION -- mapping not known -- COLUMN LOGIC TO BE CONFIMED
-- ,CASE WHEN TCD.CDCTYPE IN ( 'D','Y','N' )  THEN 'Y' ELSE 'N' END AS SOFT_DELETED_FLAG
,'Y' AS SOFT_DELETED_FLAG
,TCD.SYS_CREATED_BY
,TCD.SYS_UPDATED_BY
,convert_tz(TCD.SYS_CREATED_ON,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as CREATED_ON
,convert_tz(TCD.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') AS CHANGED_ON

FROM app_test.temp_time_card_split TCD
LEFT OUTER JOIN  ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') SUF
ON TCD.USER=SUF.SYS_ID



);
 drop TABLE  if exists app_test.temp_time_card_mddw_test1;
CREATE  TABLE app_test.temp_time_card_mddw_test1 (INDEX (row_id))  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AS (
select
tc.*
,dt.row_key as TIMECARD_ON_KEY
,dtt.row_key as TIMECARD_TIME_KEY

-- select tc.row_id
from app_test.temp_time_card_final tc

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_calendar_date) dt
on tc.time_card_on_id = dt.row_id collate utf8_unicode_ci

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_calendar_time) dtt
on tc.time_card_time_id  =dtt.row_id  collate utf8_unicode_ci


);
 drop TABLE  if exists app_test.temp_time_card_mddw_test;
CREATE TABLE app_test.temp_time_card_mddw_test (INDEX (row_id))  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AS (
select 
tc.row_id,
tc.timecard_source_id
,tc.source_id
,tc.timecard_number
,tc.TIMECARD_ON_KEY
,tc.TIMECARD_TIME_KEY
,coalesce(dct.row_key,-1) as DEPARTMENT_KEY
,coalesce(loc.row_key,-1) as LOCATION_KEY
,coalesce(tas.row_key,-1) as TASK_KEY
,coalesce(emp.row_key,-1) as EMPLOYEE_KEY
,coalesce(cat.row_key,-1) as CATEGORY_SRC_KEY
,coalesce(sta.row_key,-1) as STATE_SRC_KEY
,coalesce(pro.row_key,-1) as PROJECT_KEY
,coalesce(com.row_key,-1) as COMPANY_KEY
,coalesce(dom.row_key,-1) as DOMAIN_KEY
,coalesce(cos.row_key,-1) as COST_CENTER_KEY
,tc.CATEGORY_SRC_CODE
,tc.STATE_SRC_CODE

,tc.TIME_ENTERED AS TIME_ENTERED
,null as DESCRIPTION -- mapping not known -- COLUMN LOGIC TO BE CONFIMED -- as per DEV it is null for service now
-- ,CASE WHEN TCD.CDCTYPE IN ( 'D','Y','N' )  THEN 'Y' ELSE 'N' END AS SOFT_DELETED_FLAG
,'Y' AS SOFT_DELETED_FLAG
,tc.SYS_CREATED_BY as CREATED_BY
,tc.SYS_UPDATED_BY as CHANGED_BY
,tc.CREATED_ON
,tc.CHANGED_ON
-- ,time_card.do?sys_id=',tc.sys_id as source_url -- this is just popualted for  service now
from

app_test.temp_time_card_mddw_test1 tc

left outer join  
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_internal_organization )dct
on COALESCE(tc.department_id,'UNSPECIFIED')=dct.row_id

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_internal_contact
-- where row_key=-1
) emp
on COALESCE(tc.employee_id,'UNSPECIFIED')=emp.row_id

left outer join
(select row_id,row_key from 
 #DWH_TABLE_SCHEMA.d_task) tas
on COALESCE(tc.task_row_id,'UNSPECIFIED')=tas.row_id

left outer join
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_location) loc
on COALESCE(tc.location_id,'UNSPECIFIED')=loc.row_id

left outer join 
(select src_rowid,row_key from 
#DWH_TABLE_SCHEMA.d_lov) cat
on COALESCE(tc.category_src_code_id,'UNSPECIFIED')=cat.src_rowid

left outer join 
(select src_rowid,row_key from 
#DWH_TABLE_SCHEMA.d_lov)  sta
on COALESCE(tc.state_src_code_id,'UNSPECIFIED')=sta.src_rowid

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_project )pro
on COALESCE(tc.project_id,'UNSPECIFIED')=pro.row_id

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_internal_organization) com
on COALESCE(tc.company_id,'UNSPECIFIED')=com.row_id

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_domain) dom
on COALESCE(tc.domain_id,'UNSPECIFIED')=dom.row_id

left outer join 
(select row_id,row_key from 
#DWH_TABLE_SCHEMA.d_cost_center) cos
on COALESCE(tc.cost_center_id,'UNSPECIFIED')=cos.row_id
);
