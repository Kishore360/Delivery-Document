SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_calendar_date.' ELSE 'SUCCESS' END as Message
FROM  #STG_TABLE_SCHEMA.DS_DATE_SEED SRC
JOIN (SELECT MAX(lastupdated) AS converttz_sys_val,  
DATE(MAX(lastupdated)) AS convertz_dat_val  FROM #STG_TABLE_SCHEMA.o_data_freshness) s1
LEFT OUTER JOIN(SELECT MAX(DATE(DATE)) AS MONTH_END_DATE,
                          MIN(DATE(DATE)) AS MONTH_START_DATE
                   FROM #STG_TABLE_SCHEMA.DS_DATE_SEED
                   WHERE DATE BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
                   GROUP BY CAST(CONCAT(DATE_FORMAT(DATE,'%Y'),DATE_FORMAT(DATE,'%m')) AS SIGNED)) SRC5 
				   
ON CAST(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')) AS SIGNED) 
 = CAST(CONCAT(DATE_FORMAT(SRC5.MONTH_END_DATE,'%Y'),DATE_FORMAT(SRC5.MONTH_END_DATE,'%m')) AS SIGNED) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date TRGT
ON(CONCAT(CONCAT(DATE_FORMAT(SRC.`DATE`,'%Y'),DATE_FORMAT(SRC.`DATE`,'%m')),DATE_FORMAT(SRC.`DATE`,'%d')) =TRGT.row_id)
WHERE SRC.`DATE` BETWEEN '1970-01-01 00:00:00' AND '2030-12-31 00:00:00'
AND CASE WHEN YEAR(SRC5.MONTH_START_DATE)=YEAR(converttz_sys_val) THEN  MONTH(converttz_sys_val)-MONTH(SRC5.MONTH_START_DATE) 
WHEN YEAR(SRC5.MONTH_START_DATE)>YEAR(converttz_sys_val) THEN TIMESTAMPDIFF(MONTH,SRC5.MONTH_START_DATE,converttz_sys_val) -1
ELSE TIMESTAMPDIFF(MONTH,SRC5.MONTH_START_DATE,converttz_sys_val) END <>TRGT.lagging_count_of_month
