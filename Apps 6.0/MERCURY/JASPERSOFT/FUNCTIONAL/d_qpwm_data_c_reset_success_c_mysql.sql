
 
 
   
  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_qpwm_data_c.reset_success_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(select 
count(1) as CNT
 from mercury_mdsdb.qpwm_data_final SRC
 join mercury_mdwdb.d_qpwm_data_c TRGT on SRC.row_date=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where coalesce(nullif(SRC.reset_success,''),'UNSPECIFIED') <>TRGT.reset_success_c)a;
 