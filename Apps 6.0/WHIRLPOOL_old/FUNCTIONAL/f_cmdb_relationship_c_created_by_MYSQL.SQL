SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_cmdb_relationship_c.created_by' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.cmdb_rel_ci_final a11
 left join whirlpool_workdb.f_cmdb_relationship_c a12
 ON a11.sys_id = a12.row_id  AND a11.sourceinstance = a12.source_id
where a11.sys_created_by<>a12.created_by

 )ma
  ;


