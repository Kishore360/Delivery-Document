
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select sla.task, sla.planned_end_time,sla.sourceinstance
  FROM homedepot_mdsdb.task_sla_final sla
    JOIN ( 
		SELECT task,max(sla.sys_updated_on) as sys_updated_on,planned_end_time as due_on,sla.sourceinstance
		FROM homedepot_mdsdb.task_sla_final sla
		join homedepot_mdsdb.task_final tf
		 ON sla.task = tf.sys_id and sla.sourceinstance = tf.sourceinstance
		where tf.sys_class_name = 'problem'  and sla.stage <> 'cancelled' 
		group by 1
		) latest ON sla.task = latest.task and sla.sys_updated_on = latest.sys_updated_on and latest.sourceinstance = sla.sourceinstance
			
	where sla.sys_updated_on = latest.sys_updated_on
)iq 
	join homedepot_mdwdb.d_problem dp
	on iq.task=dp.row_id and iq.sourceinstance=dp.source_id
WHERE date(convert_tz(iq.planned_end_time,'GMT','America/New_York'))<> date(dp.due_on_c)

