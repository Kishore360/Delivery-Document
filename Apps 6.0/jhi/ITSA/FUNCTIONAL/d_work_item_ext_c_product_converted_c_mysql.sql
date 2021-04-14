SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.product_converted_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON 
SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
JOIN jhi_mdwdb.d_lov d_lov ON
d_lov.row_key=TRGT.wi_prodt_team_sdlc_conf_phase_c_key
WHERE  
CASE WHEN d_lov.dimension_name in ('Phase 2','Phase 3') THEN 'Y' ELSE 'N' END <> (TRGT.product_converted_c) and TRGT.soft_deleted_flag ='N';