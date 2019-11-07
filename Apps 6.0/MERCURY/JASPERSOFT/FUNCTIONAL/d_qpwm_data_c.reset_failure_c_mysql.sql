   
  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_qpwm_data_c.reset_failure_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(select 
count(1) as CNT
 from meritsa_mdsdb.qpwm_data_final SRC
 left join meritsa_mdwdb.d_qpwm_data_c TRGT on SRC.row_date=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype<>'D'
 where coalesce(nullif(SRC.reset_failure,''),'UNSPECIFIED') <>TRGT.reset_failure_c)a;