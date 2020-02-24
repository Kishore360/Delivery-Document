SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_psi_flag_c' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.change_request_final  SRC 
left join discover_mdsdb.std_change_producer_version_final a  
on SRC.std_change_producer_version=a.sys_id and SRC.sourceinstance=a.sourceinstance
left join   discover_mdsdb.std_change_record_producer_final b 
on a.std_change_producer=b.sys_id and a.sourceinstance=b.sourceinstance
JOIN discover_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE (b.sys_name<>'Chef Client Runs' or SRC.std_change_producer_version is null) and  (CASE WHEN SRC.u_psi_flag = 1 then 'Y' else 'N' END) <> (TRGT.u_psi_flag_c) 
