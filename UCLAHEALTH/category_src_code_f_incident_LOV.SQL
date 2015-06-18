
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT c_row_key,b_state_src_key FROM(
select a.sys_id,b.row_id,a.u_category,b.state_src_key b_state_src_key,b.state_src_code,
coalesce(c.row_key,-1) c_row_key,c.dimension_name
from uclahealth_mdwdb.f_incident b
inner join uclahealth_mdsdb.incident_final a
on sys_id= b.row_id 
left join uclahealth_mdwdb.d_lov c
on dimension_class like 'CATEGORY~INCIDENT%'
and dimension_code=u_category 
)H 
where c_row_key<>b_state_src_key)E)i;