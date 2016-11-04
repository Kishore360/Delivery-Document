
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.d_internal_organization dio
JOIN(
select a.sys_id,a.sourceinstance, group_concat(distinct b.name) as assignment_group_type_c
from uclahealth_mdwdb.d_internal_organization di2 join 
uclahealth_mdsdb.sys_user_group_final a
on right(di2.row_id,32)=a.sys_id 
and a.sourceinstance=di2.source_id
left join
    uclahealth_mdsdb.sys_user_group_type_final b
     on find_in_set(b.sys_id, a.type) > 0
group by a.sys_id) temp
ON temp.sys_id = right(dio.row_id,32)
  AND  temp.sourceinstance = dio.source_id
where dio.assignment_group_type_c <> temp.assignment_group_type_c)a

