SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_stask_final a
 join paloalto_mdwdb.d_sr_task_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where CONVERT_TZ(a.u_planned_end_date,
                'GMT',
                'America/Los_Angeles')<>b.planned_end_date;
				
				
				
				