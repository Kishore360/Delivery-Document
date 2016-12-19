SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.f_change_request a11
join jnj_mdsdb.change_request_final a12 on a11.row_id = a12.sys_id and a11.source_id= a12.sourceinstance
join jnj_mdwdb.d_internal_contact a13 on COALESCE(CONCAT ('INTERNAL_CONTACT~',a12.u_customer_name), 'UNSPECIFIED')= a13.row_id
WHERE 
a11.customer_name_c_key <> a13.row_key
)E;