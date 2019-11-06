SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_cmdb_relationship_c.parent_configuration_item_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.cmdb_rel_ci_final SRC
 left join whirlpool_workdb.f_cmdb_relationship_c TRGT
 ON SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance =TRGT.source_id
 join  whirlpool_mdsdb.cmdb_ci_final m_parent
 on SRC.parent=m_parent.sys_id
 and SRC.sourceinstance=m_parent.sourceinstance
 join whirlpool_mdsdb.cmdb_ci_final m_child
 on SRC.child=m_child.sys_id
 and SRC.sourceinstance=m_child.sourceinstance
left join whirlpool_mdwdb.d_configuration_item LKP
on m_parent.sys_id=LKP.row_id
and m_parent.sourceinstance=LKP.source_id
where COALESCE(LKP.row_key,CASE WHEN m_parent.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.portfolio_c_key)
and SRC.CDCTYPE='X'
and m_child.sys_class_name in ('cmdb_ci_service','u_cmdb_ci_technical_service') and m_parent.sys_class_name = 'cmdb_ci_service'

 )ma
  ;
