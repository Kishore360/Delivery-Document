SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.last_discovered_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  wpl_mdsdb.cmdb_ci_final a
 left join wpl_mdwdb.d_configuration_item b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where a.last_discovered<>b.last_discovered_c and b.soft_deleted_flag='N' and a.cdctype='X')ma