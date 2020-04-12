SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_change_credit_score_monthly.minor_incident_deduction' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_n_change_credit_score_monthly_base SRC
 
 LEFT JOIN ge_mdwdb.f_n_change_credit_score_monthly TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.minor_incident_deduction, '')<> COALESCE(TRGT.minor_incident_deduction ,'');