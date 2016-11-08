SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from (select a.assignee_reassignment_count_c,count(b.documentkey) as cnt_doc from homedepot_mdwdb.f_problem_task a 
left join homedepot_mdsdb.sys_audit_final b
on a.row_id=b.documentkey
where b.tablename='u_problem_task'
and b.fieldname='assigned_to'
and b.newvalue IS NOT NULL 
group by b.documentkey) temp where assignee_reassignment_count_c <> cnt_doc)temp_table;