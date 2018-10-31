SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_aetna_system_environments_c.u_aetna_system_environment' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance,u_aetna_system_environment from aetna_mdsdb.u_aetna_system_environments_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_aetna_system_environments_c trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where  coalesce(src.u_aetna_system_environment,'UNSPECIFIED') <> trgt.name;