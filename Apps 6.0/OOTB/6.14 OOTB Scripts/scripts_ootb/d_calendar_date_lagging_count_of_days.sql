SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.lagging_count_of_days' ELSE 'SUCCESS' END as Message
FROM  #STG_TABLE_SCHEMA.DS_DATE_SEED SRC
JOIN (SELECT MAX(lastupdated) AS converttz_sys_val,  
DATE(MAX(lastupdated)) AS convertz_dat_val  FROM #STG_TABLE_SCHEMA.o_data_freshness) s1 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CASE WHEN SRC.`DATE` = convertz_dat_val THEN 0 ELSE DATEDIFF(converttz_sys_val,SRC.`DATE`) END
<>TRGT.lagging_count_of_days
