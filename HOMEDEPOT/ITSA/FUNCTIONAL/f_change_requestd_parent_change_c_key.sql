SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
 from homedepot_mdsdb.change_request_final a
left join homedepot_mdwdb.d_change_request c
on a.u_parent_change = c.row_id and a.sourceinstance=c.source_id
 left  JOIN  homedepot_mdwdb.f_change_request b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
 where c.row_key <> b.parent_change_request_key  )b