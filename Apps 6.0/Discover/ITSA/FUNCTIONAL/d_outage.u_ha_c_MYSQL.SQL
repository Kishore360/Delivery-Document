SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.u_ha_c' ELSE 'SUCCESS' END as Message FROM discover_mdsdb.cmdb_ci_outage_final  SRC 
JOIN discover_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE (CASE WHEN SRC.u_ha = 1 then 'Y' else 'N' END) <> (TRGT.u_ha_c) and SRC.cdctype='X'
