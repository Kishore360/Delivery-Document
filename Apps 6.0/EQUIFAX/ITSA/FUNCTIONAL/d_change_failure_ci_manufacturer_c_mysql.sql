SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.ci_manufacturer_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
left join equifax_mdsdb.cmdb_ci_final ci
on SRC.cmdb_ci=ci.sys_id and ci.sourceinstance=SRC.sourceinstance
left join equifax_mdsdb.core_company_final comp
on ci.manufacturer=comp.sys_id and ci.sourceinstance=comp.sourceinstance
WHERE CASE WHEN SRC.cmdb_ci is null or ci.manufacturer is null or comp.name is null then 'UNSPECIFIED'
WHEN ci.sys_id is null or comp.sys_id is null then 'UNKNOWN' else comp.name end<>TRGT.ci_manufacturer_c and SRC.cdctype<>'D';
