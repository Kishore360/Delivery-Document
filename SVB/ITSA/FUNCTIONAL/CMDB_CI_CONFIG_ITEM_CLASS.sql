
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM 
svb_mdsdb.cmdb_ci_final a
left join svb_mdsdb.sys_db_object_final b
on a.sys_class_name=b.name and a.sourceinstance=b.sourceinstance
left join svb_mdwdb.d_configuration_item c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where c.label_c<>b.label






