SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.problem_final a
 join paloalto_mdwdb.d_problem b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where  CONVERT_TZ(a.u_actual_start_time,
                'GMT',
                'America/Los_Angeles')<>b.actual_start_date_time_c;