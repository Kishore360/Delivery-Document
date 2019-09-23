SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1)cnt from 
(select number,convert_tz(max(s1.sys_created_on),'GMT','America/New_York' ) as Due_on,d.due_on due_on_trgt from rogers6_mdsdb.problem_final s
join rogers6_mdsdb.u_pm_action_items_final s1 on s.u_problem=s1.u_pm_number
join  rogers6_mdwdb.d_problem d on s.sys_id=d.row_id and s.sourceinstance=d.source_id
where s.CDCTYPE='X' and s1.CDCTYPE='X'  
group by 1)a
where due_on<>due_on_trgt)a1;


