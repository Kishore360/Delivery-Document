SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM 
tivo_mdwdb.d_request a
LEFT JOIN (
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'IT-Requests' as task_type  from 
 tivo_mdsdb.u_tech_ops_request_final b
where b.sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'Request Items' as task_type from 
tivo_mdsdb.sc_req_item_final b
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'Request' as task_type from 
tivo_mdsdb.sc_request_final b) b on a.row_id=b.sys_id AND a.source_id=b.sourceinstance
WHERE a.task_type_c<>coalesce(task_type,'UNSPECIFIED') and a.soft_deleted_flag='N'
