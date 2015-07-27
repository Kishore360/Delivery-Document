
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
select c.row_key,a.state_src_key, b.u_change_state,
CONCAT('STATE~CHANGE_REQUEST~~~',b.u_change_state),c.dimension_name
from svb_mdwdb.f_change_request a
inner join svb_mdsdb.change_request  b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join svb_mdwdb.d_lov c
on c.dimension_class like '%STATE~CHANGE_REQUEST%'
and CONCAT('STATE~CHANGE_REQUEST~~~',b.u_change_state)=c.src_rowid
where c.row_key<>a.state_src_key

)E

)i;