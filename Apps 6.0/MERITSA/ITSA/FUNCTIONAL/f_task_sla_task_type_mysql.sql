SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdwdb.f_task_sla a join 
mercury_mdsdb.task_sla_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance and b.cdctype='X'
 left join mercury_mdwdb.d_task  c on c.row_id=b.task and c.source_id=b.sourceinstance
left join mercury_mdsdb.sys_db_object_final d on c.task_type_src_code=d.name and a.source_id=d.sourceinstance and d.cdctype='X'
where  a.task_type<> coalesce(d.label  , case when c.row_id is null then 'UNKNOWN' else 'UNSPECIFIED' end)

