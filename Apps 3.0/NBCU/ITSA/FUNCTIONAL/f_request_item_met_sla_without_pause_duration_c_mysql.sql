SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
		select count(*) as cnt
		from
		(
			select count(1) 
			FROM 
				nbcu_mdwdb.f_request_item d_inc
			LEFT JOIN 
				nbcu_mdsdb.task_sla_final a
				ON a.TASK = d_inc.row_id 
				and a.sourceinstance=d_inc.source_id
			join 
				nbcu_mdsdb.contract_sla_final b 
				on a.sla=b.sys_id  
			Join 
					(
					Select a.task as task,
					Max(a.planned_end_time) as planned_end_time
					From nbcu_mdsdb.task_sla_final a
					join nbcu_mdsdb.contract_sla_final b 
					on a.sla=b.sys_id  where a.stage <> 'Cancelled'
					and b.name LIKE '%RITM%(No Pause)%' and b.collection='sc_req_item' 
					Group by a.task) latest
				On a.task = latest.task
				And a.planned_end_time = latest.planned_end_time
			where 
				a.stage <> 'Cancelled'
				and b.name LIKE '%RITM%(No Pause)%' and b.collection='sc_req_item'  
				GROUP BY a.task
			having timestampdiff(SECOND, '1970-01-01 00:00:00',max(a.duration)) <> max(d_inc.met_sla_without_pause_duration_c)
		)a
)a 
;