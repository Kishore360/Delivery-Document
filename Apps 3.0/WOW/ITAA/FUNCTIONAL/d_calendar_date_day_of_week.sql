SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.day_of_week' ELSE 'SUCCESS' END as Message
FROM  wow_workdb.D_DATE_SEED SRC
LEFT JOIN wow_mdwdb.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CASE WHEN(DATE_FORMAT(SRC.`DATE`,'%w')) = 0 THEN '7' ELSE(DATE_FORMAT(SRC.`DATE`,'%w')) END <>TRGT.day_of_week
