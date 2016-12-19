SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.d_change_request a11
join jnj_mdsdb.change_request_final a12 on a11.row_id = a12.sys_id and a11.source_id= a12.sourceinstance
join jnj_mdwdb.d_lov a13 on COALESCE(CONCAT ('EMERGENCY_TYPE_C~CHANGE_REQUEST~~~',a12.u_emergency_type), 'UNSPECIFIED')= a13.row_id
WHERE 
a11.change_request_emergency_type_c_key <> a13.row_key
)E;
