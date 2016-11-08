SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from (select a.vp_change_count_c,count(b.documentkey) as cnt_doc from homedepot_mdwdb.f_problem a 
left join homedepot_mdsdb.sys_audit_final b
on a.row_id=b.documentkey
where b.tablename='problem'
and b.fieldname='u_assigned_vp'
and b.newvalue IS NOT NULL 
group by b.documentkey) temp where vp_change_count_c <> cnt_doc)temp_table;