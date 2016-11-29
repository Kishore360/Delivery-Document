
SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (select count(1) as cnt  from (

select b.row_key,c.task_fss_c_key
 from 
gilead_mdsdb.u_task_fss_final a
left join gilead_mdwdb.f_task_fss_c c 
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left outer join gilead_mdwdb.d_task_fss_c b on
a.sys_id=b.row_id and a.sourceinstance=b.source_id)h
where row_key<> task_fss_c_key)C

