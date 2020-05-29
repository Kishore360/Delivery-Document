SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_cmdb_relationship_c.child_configuration_item_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 wpl_mdsdb.cmdb_rel_ci_final SRC
 left join wpl_mdwdb.f_cmdb_relationship_c TRGT
 ON SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance =TRGT.source_id
left join wpl_mdwdb.d_configuration_item LKP
on SRC.child=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where COALESCE(LKP.row_key,CASE WHEN SRC.child IS NULL THEN 0 else -1 end)<> (TRGT.child_configuration_item_c_key)
 and SRC.CDCTYPE='X')ma
  ;