-- disabling the script as it fails for calender type where weeks will be counted from last week of last year if the days are reamining after complete week

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.week_name' ELSE 'SUCCESS' END as Message
FROM  #STG_TABLE_SCHEMA.DS_DATE_SEED SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CONCAT(CONCAT(YEAR(DATE_ADD(DATE,INTERVAL 6 - WEEKDAY(DATE) DAY)),'-W'),DATE_FORMAT(SRC.`DATE`,'%v')) <>TRGT.week_name
