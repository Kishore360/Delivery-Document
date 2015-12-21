SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  from
svb_mdsdb.sc_task_final a join
 svb_mdwdb.f_request_task b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where date_format(convert_tz(a.due_date,'GMT','US/Mountain'),'%Y%m%d')<>b.due_date_c_key)b

