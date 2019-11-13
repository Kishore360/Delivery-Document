
     
  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_qpwm_data_fact_c.row_c_key' 
ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT
   FROM mercury_mdsdb.qpwm_data_final 
   SRC left JOIN mercury_mdwdb.f_qpwm_data_fact_c TRGT ON (SRC.row_date = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D' ) 
   join mercury_mdwdb.d_calendar_date LKP on coalesce(DATE_FORMAT(STR_TO_DATE(SRC.row_date,'%m/%d/%Y'),'%Y%m%d')
   ,DATE_FORMAT(STR_TO_DATE(SRC.row_date,'%m-%d-%Y'),'%Y%m%d'))=LKP.row_id
   where coalesce(LKP.row_key,case when SRC.row_date is null then 0 else -1 end)<>TRGT.row_c_key)a
   