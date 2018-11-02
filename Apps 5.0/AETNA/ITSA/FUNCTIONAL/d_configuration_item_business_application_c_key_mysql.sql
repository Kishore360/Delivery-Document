SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.business_application_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select sys_id, sourceinstance from aetna_mdsdb.cmdb_ci_final where CDCTYPE<>'D') src
LEFT JOIN aetna_mdsdb.u_cmdb_ci_business_application_final business_application
	on src.sys_id = business_application.sys_id and src.sourceinstance = business_application.sourceinstance
    left join aetna_mdwdb.d_business_application_c lkp on business_application.sys_id=lkp.row_id and business_application.sourceinstance=lkp.source_id
 left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(lkp.row_key,case when business_application.sys_id is null then 0 else -1 end) <> trgt.business_application_c_key;