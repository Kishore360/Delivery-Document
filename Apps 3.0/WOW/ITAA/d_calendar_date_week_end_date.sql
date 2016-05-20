SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.' ELSE 'SUCCESS' END as Message
FROM  #STG_TABLE_SCHEMA.DS_DATE_SEED SRC
LEFT OUTER JOIN(SELECT DATE AS WCALENDAR_DATE,
                          DATE_SUB(DATE,INTERVAL WEEKDAY(DATE) DAY) AS WEEK_START_DATE,
                          DATE_ADD(DATE,INTERVAL 6 - WEEKDAY(DATE) DAY) AS WEEK_END_DATE
                   FROM #STG_TABLE_SCHEMA.DS_DATE_SEED
                   WHERE DATE BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00') SRC6 
ON DATE(SRC.`DATE`) = SRC6.WCALENDAR_DATE
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND SRC6.WEEK_END_DATE<>TRGT.week_end_date
