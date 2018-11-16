SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 	
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.assigneepriorfailurerate_bucket_c_key' ELSE 'SUCCESS' END as Message 	
FROM fidelity_mdsdb.change_request_final src	
JOIN fidelity_mdwdb.f_change_request trgt	
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id	
LEFT JOIN fidelity_mdwdb.d_lov LKP	
ON ((COALESCE((assignee_prior_failure_changes_c/assignee_prior_changes_c),-1)*100 >= LKP.lower_range_value 
and COALESCE((assignee_prior_failure_changes_c/assignee_prior_changes_c),-1)*100  < LKP.upper_range_value)	
	AND LKP.dimension_class = 'ASSIGNEEPRIORFAILURERATEBUCKET_WH~CHANGE_REQUEST' )
 WHERE coalesce(LKP.row_key,case when trgt.assignee_prior_failure_changes_c is null then 0 else -1 end ) 
 <> trgt.assigneepriorfailurerate_bucket_c_key; 	
