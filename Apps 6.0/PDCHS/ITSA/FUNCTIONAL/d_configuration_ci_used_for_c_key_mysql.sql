
 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.application_tier_src_c_key' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_used_for from  pdchs_mdsdb.cmdb_ci_final where CDCTYPE<>'D') src
left join (select sys_id,sourceinstance,u_used_for,used_for from  pdchs_mdsdb.cmdb_ci_service_final where CDCTYPE<>'D') src2
on src.u_used_for=src2.used_for and src.sourceinstance=src2.sourceinstance
JOIN  pdchs_mdwdb.d_configuration_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN pdchs_mdwdb.d_lov lkp
ON COALESCE(CONCAT('USED_FOR_C~CI_SERVICE~',src2.u_used_for),'UNSPECIFIED') =lkp.row_id 
where COALESCE(lkp.row_key,CASE WHEN src2.u_used_for IS NULL THEN 0 else -1 end)<> trgt.ci_used_for_c_key
;
