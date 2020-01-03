SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.change_template_c_key' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.change_request_final  SRC 
left join discover_mdsdb.std_change_producer_version_final a  
on SRC.std_change_producer_version=a.sys_id and SRC.sourceinstance=a.sourceinstance
left join   discover_mdsdb.std_change_record_producer_final b 
on a.std_change_producer=b.sys_id and a.sourceinstance=b.sourceinstance
JOIN discover_mdwdb.f_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN discover_mdwdb.d_sys_template_c LKP ON (SRC.u_template = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE (b.sys_name<>'Chef Client Runs' or SRC.std_change_producer_version is null) and 
COALESCE(LKP.row_key,CASE WHEN SRC.u_template IS NULL THEN 0 else -1 end)<> (TRGT.change_template_c_key) 

