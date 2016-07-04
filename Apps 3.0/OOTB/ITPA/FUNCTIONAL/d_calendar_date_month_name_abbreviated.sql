SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.month_name_abbreviated' ELSE 'SUCCESS' END as Message
FROM  <<tenant>>_workdb.DS_DATE_SEED SRC
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND DATE_FORMAT(SRC.`DATE`,'%b') <>TRGT.month_name_abbreviated
