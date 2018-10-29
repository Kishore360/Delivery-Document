SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_business_application_c.operational_status_business_src_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance,operational_status from aetna_mdsdb.u_cmdb_ci_business_application_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_business_application_c trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join aetna_mdwdb.d_lov lkp on coalesce(concat('OPERATION_STATUS~BUSINESS_APPLICATION~~~', src.operational_status),'UNSPECIFIED')=
lkp.row_id and src.sourceinstance=lkp.source_id
where  coalesce(lkp.row_key, case when  src.operational_status is null then 0 else -1 end) <> trgt.operational_status_business_src_c_key;