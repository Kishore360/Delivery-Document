SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_configuration_item.application_tier_src_c_key' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_risk  from pdchs_mdsdb.cmdb_ci_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_configuration_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.u_risk,'UNSPECIFIED')<> trgt.risk_c
;