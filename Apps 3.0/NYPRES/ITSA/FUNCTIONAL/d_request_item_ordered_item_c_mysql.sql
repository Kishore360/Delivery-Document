SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from nypres_mdsdb.sc_req_item_final s
left  JOIN nypres_mdwdb.d_request_item t  on  t.row_id=s.sys_id and s.sourceinstance=t.source_id 
where s.u_ordered_item <> t.ordered_item_c) temp
