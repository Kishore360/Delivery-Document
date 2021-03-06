SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.lagging_count_of_year' ELSE 'SUCCESS' END as Message
FROM  wow_workdb.DS_DATE_SEED SRC
JOIN (SELECT MAX(lastupdated) AS tz_sys_val,  
DATE(MAX(lastupdated)) AS z_dat_val  FROM wow_workdb.o_data_freshness) s1
LEFT OUTER JOIN(SELECT MAX(DATE(DATE)) AS YEAR_END_DATE,MIN(DATE(DATE)) AS YEAR_START_DATE) SRC2   
ON CAST(DATE_FORMAT(SRC.`DATE`,'%Y') AS SIGNED) = YEAR(SRC2.YEAR_END_DATE) 
LEFT JOIN wow_mdwdb.d_calendar_date TRGT 
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND IF(YEAR(SRC2.YEAR_START_DATE)<=YEAR(tz_sys_val),YEAR(tz_sys_val)-YEAR(SRC2.YEAR_START_DATE),NULL)<>TRGT.lagging_count_of_year
