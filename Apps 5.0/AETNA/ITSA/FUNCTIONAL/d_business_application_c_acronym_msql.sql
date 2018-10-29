SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_business_application_c.acronyms' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance,u_app_acronym from aetna_mdsdb.u_cmdb_ci_business_application_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_business_application_c trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where  coalesce(src.u_app_acronym,'UNSPECIFIED') = trgt.acronyms;