SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_cost_gis_c_date_key_c.date_key_c' ELSE 'SUCCESS' END as Message  
 FROM 
 (
 SELECT count(1) as cnt 
 FROM wpl_mdsdb.us_ios_cost_metrics_capital_final SRC 
 LEFT JOIN wpl_mdwdb.d_cost_gis_c TRGT ON concat(DATE_FORMAT(STR_TO_DATE(SRC.date,'%m-%d-%Y'), '%Y%m%d'),'~','Cost Metrics Ex')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and flag='Cost Metrics Ex'
 WHERE DATE_FORMAT(STR_TO_DATE(SRC.date,'%m-%d-%Y'), '%Y%m%d') <>date_key_c and SRC.cdctype<>'D'
 ) temp;