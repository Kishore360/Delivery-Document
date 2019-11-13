
     
  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_syseng_server_inv_history_fact_c.row_c_key' 
ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT
   			mercury_mdsdb.syseng_server_inv_history_fianl SRC 
				join 
				mercury_mdwdb.f_syseng_server_inv_history_fact_c TRGT 
				on DATE_FORMAT(STR_TO_DATE(SRC.date_time,
                '%Y-%m-%d'),
                '%Y%m%d')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype<>'D' ) 
   join mercury_mdwdb.d_calendar_date LKP on coalesce(DATE_FORMAT(STR_TO_DATE(SRC.date_time,'%m/%d/%Y'),'%Y%m%d')
   ,DATE_FORMAT(STR_TO_DATE(SRC.date_time,'%m-%d-%Y'),'%Y%m%d'))=LKP.row_id
   where coalesce(LKP.row_key,case when SRC.date_time is null then 0 else -1 end)<>TRGT.row_c_key)a
   