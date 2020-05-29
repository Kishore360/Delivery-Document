 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_dq_change_monthly_fact.n_key' ELSE 'SUCCESS' END as Message
-- select SRC.sys_id , TRGT.row_id ,SRC.changed_on,TRGT.changed_on
FROM #STG_TABLE_SCHEMA.f_n_dq_change_monthly_fact_base SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_n_dq_change_monthly_fact TRGT 
ON (SRC.sys_id = TRGT.row_id 
/*AND SRC.source_id=TRGT.source_id*/ AND SRC.n_key=TRGT.n_key)
 
WHERE  COALESCE(SRC.n_key, '0') <> COALESCE(TRGT.n_key, '0'); 