
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
svb_mdsdb.sc_task_final a join
 svb_mdwdb.d_request_task b
on a.sys_id=b.row_id
and a.sourceinstance=b.source_id
where  case when a.u_reclassify=1 then 'Y' ELSE 'N' END <>b.reclassify_flag_c)b