SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
-- select f.segment_c_key,d.segment_c_key
FROM  
ibmwatson_mdsdb.label_entry_final   led
		LEFT JOIN             ibmwatson_mdsdb.label_final  lf                ON led.label = lf.sys_id  and led.sourceinstance=2
		LEFT OUTER JOIN ibmwatson_mdsdb.task_final t ON led.table_key = t.sys_id and t.sourceinstance=2 and t.sys_class_name='problem'
        join ibmwatson_mdsdb.cmdb_ci_final a on t.cmdb_ci=a.sys_id and t.sourceinstance=2
join ibmwatson_mdwdb.d_tribe_c d on a.u_tribe=d.row_id and a.sourceinstance=d.source_id and a.cdctype<>'D'
join ibmwatson_mdwdb.f_task_tag_c f on led.sys_id=f.row_id and f.source_id=2
where f.segment_c_key<>d.segment_c_key)a;

