 
  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_qpwm_data_fact_c.change_success_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(select 
count(1) as CNT
 from meritsa_mdsdb.qpwm_data_final SRC
left  join meritsa_mdwdb.f_qpwm_data_fact_c TRGT on SRC.row_date=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where coalesce(nullif(SRC.change_success,''),'UNSPECIFIED') <>TRGT.change_success_c and SRC.cdctype<>'D')a;