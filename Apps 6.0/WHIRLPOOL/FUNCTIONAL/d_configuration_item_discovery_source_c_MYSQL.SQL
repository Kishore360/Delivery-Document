SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.discovery_source_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdwdb.d_configuration_item a
 join  whirlpool_mdsdb.cmdb_ci_server_final b
 on a.row_id=b.sys_id and a.source_id=b.sourceinstance
 where coalesce(b.discovery_source,'UNSPECIFIED')<>a.discovery_source_c and b.CDCTYPE<>'D')ma