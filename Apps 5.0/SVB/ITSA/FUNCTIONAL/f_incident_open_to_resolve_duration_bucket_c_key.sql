SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdwdb.f_incident as fi 
LEFT OUTER JOIN svb_mdwdb.d_lov as lov ON ceil(fi.open_to_resolve_duration/3600) BETWEEN lov.lower_range_value AND lov.upper_range_value  
WHERE (fi.open_to_resolve_duration_bucket_c_key <> lov.row_key OR fi.open_to_resolve_duration_bucket_c_key IS NULL) AND (lov.dimension_class = 'RESOLVEDDURATIONBUCKET_WH~INCIDENT' OR lov.row_key in (0,-1))  and coalesce(lov.row_key, -1) <>fi.open_to_resolve_duration_bucket_c_key)b
