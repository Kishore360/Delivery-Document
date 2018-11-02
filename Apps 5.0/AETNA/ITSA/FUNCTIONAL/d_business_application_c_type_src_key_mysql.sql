SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_business_application_c.u_type' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance,u_type from aetna_mdsdb.u_cmdb_ci_business_application_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_business_application_c trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join aetna_mdwdb.d_lov lkp on coalesce(concat('TYPE~BUSINESS_APPLICATION~~~', src.u_type),'UNSPECIFIED')=
lkp.row_id and src.sourceinstance=lkp.source_id
where  coalesce(lkp.row_key, case when  src.u_type is null then 0 else -1 end) <> trgt.type_src_key;