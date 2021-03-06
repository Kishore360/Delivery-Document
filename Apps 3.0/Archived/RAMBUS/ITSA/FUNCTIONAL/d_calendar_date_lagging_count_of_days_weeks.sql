SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.lagging_count_of_weeks' ELSE 'SUCCESS' END as Message
FROM  rambus_workdb.DS_DATE_SEED SRC
JOIN (SELECT MAX(lastupdated) AS tz_sys_val,  
DATE(MAX(lastupdated)) AS z_dat_val  FROM rambus_workdb.o_data_freshness) s1
LEFT OUTER JOIN(SELECT DATE AS WCALENDAR_DATE,
                          DATE_SUB(DATE,INTERVAL WEEKDAY(DATE) DAY) AS WEEK_START_DATE,
                          DATE_ADD(DATE,INTERVAL 6 - WEEKDAY(DATE) DAY) AS WEEK_END_DATE
                   FROM rambus_workdb.DS_DATE_SEED
                   WHERE DATE BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00') SRC6 
ON DATE(SRC.`DATE`) = SRC6.WCALENDAR_DATE
LEFT JOIN rambus_mdwdb.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CASE WHEN YEAR(SRC6.WEEK_START_DATE)=YEAR(tz_sys_val) THEN IF(WEEK(tz_sys_val,1)-WEEK(SRC6.WEEK_START_DATE,1) <0,NULL,WEEK(tz_sys_val,1)-WEEK(SRC6.WEEK_START_DATE,1)) ELSE IF(TIMESTAMPDIFF(DAY,SRC6.WEEK_START_DATE,DATE_ADD(DATE(tz_sys_val), INTERVAL 6-WEEKDAY(DATE(tz_sys_val)) DAY))<0,NULL,TIMESTAMPDIFF(WEEK,SRC6.WEEK_START_DATE,tz_sys_val)) END 
<>TRGT.lagging_count_of_weeks;