SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.os_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.cmdb_ci_server_final a
 left join whirlpool_mdwdb.d_configuration_item b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where COALESCE(a.os,'UNSPECIFIED')<>b.os_c and b.soft_deleted_flag='N')ma