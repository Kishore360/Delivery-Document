SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_business_application_c.acronyms' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as cnt from aetna_mdsdb.u_cmdb_ci_business_application_final src
left join aetna_mdwdb.d_business_application_c trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where  coalesce(src.u_app_acronym,'UNSPECIFIED')<>trgt.acronyms and trgt.soft_deleted_flag='N')ma;