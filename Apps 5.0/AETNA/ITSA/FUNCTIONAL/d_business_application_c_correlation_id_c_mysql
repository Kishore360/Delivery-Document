SELECT CASE WHEN count(1)>1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)>1  THEN 'MDS to DWH 
data validation failed for d_incident.last_resolved_by_key' ELSE 'SUCCESS' END as Message 
FROM(
select sys_id,row_id ,correlation_id,correlation_id_c  from aetna_mdsdb.u_cmdb_ci_business_application_final
join  aetna_mdwdb.d_business_application_c on sys_id=row_id where  correlation_id<>correlation_id_c)a;


