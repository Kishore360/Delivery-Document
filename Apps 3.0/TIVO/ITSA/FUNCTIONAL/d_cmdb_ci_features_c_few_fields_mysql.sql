SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM tivo_mdsdb.u_cmdb_ci_features_final src
join tivo_mdwdb.d_cmdb_ci_features_c trgt on sys_id=row_id and sourceinstance=source_id
where 
src.name<>trgt.name or 
feature_type_c<>u_feature_type or 
features_24_7_coverage_c_flag<>case when u_24_7_coverage=1 then 'Y' else'N' end 


