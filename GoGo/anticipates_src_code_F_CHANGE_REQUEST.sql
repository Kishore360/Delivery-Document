SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.f_change_request i on s.sys_id=i.row_id 
and s.sourceinstance = i.source_id
where coalesce(s.u_outage_anticipated ,' ')<>coalesce(i.outage_anticipated_src_code_c ,' ')
) c;
 
