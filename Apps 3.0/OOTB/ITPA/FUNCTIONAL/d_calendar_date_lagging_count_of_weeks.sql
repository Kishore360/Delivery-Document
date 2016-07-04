SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.' ELSE 'SUCCESS' END as Message
FROM  <<tenant>>_workdb.DS_DATE_SEED SRC
JOIN (SELECT MAX(lastupdated) AS converttz_sys_val,  
DATE(MAX(lastupdated)) AS convertz_dat_val  FROM <<tenant>>_workdb.o_data_freshness) s1
LEFT OUTER JOIN(SELECT DATE AS WCALENDAR_DATE,
                          DATE_SUB(DATE,INTERVAL WEEKDAY(DATE) DAY) AS WEEK_START_DATE,
                          DATE_ADD(DATE,INTERVAL 6 - WEEKDAY(DATE) DAY) AS WEEK_END_DATE
                   FROM <<tenant>>_workdb.DS_DATE_SEED
                   WHERE DATE BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00') SRC6 
ON DATE(SRC.`DATE`) = SRC6.WCALENDAR_DATE
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CASE WHEN YEAR(SRC6.WEEK_START_DATE)=YEAR(converttz_sys_val) THEN 
	WEEK(converttz_sys_val,1)-WEEK(SRC6.WEEK_START_DATE,1)
ELSE TIMESTAMPDIFF(WEEK,SRC6.WEEK_START_DATE,converttz_sys_val) END 
<>TRGT.lagging_count_of_weeks
