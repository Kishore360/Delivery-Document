SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_change_credit_score_monthly.successful_changes' ELSE 'SUCCESS' END as Message
FROM fidelity_mdwdb.f_n_change_credit_score_monthly_base SRC
 
 LEFT JOIN fidelity_mdwdb.f_n_change_credit_score_monthly TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.successful_changes, '')<> COALESCE(TRGT.successful_changes ,'');