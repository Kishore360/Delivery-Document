SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 	

(select count(1) cnt  from mercuryinsurance_mdwdb.f_cmdb_ci_name_c t right join (
select sys_id,coalesce(substring_index( substring_index(u_ci_name,',',x),',','-1'),'UNSPECIFIED') as name_id
, length(u_ci_name)-length(replace(u_ci_name,',',''))+1 as count ,u_ci_name
from mercuryinsurance_mdsdb.change_request_final a 
join (select (t*10+u+1) x from
(select 0 t union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) A,
(select 0 u union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) B
order by x)  n
  on   length(u_ci_name)-length(replace(u_ci_name,',',''))+1 > x-1) a on t.row_id =concat(a.sys_id,'~',a.name_id)
left join mercuryinsurance_mdwdb.d_configuration_item b on a.name_id=b.row_id  

WHERE COALESCE(b.row_key,CASE WHEN a.u_ci_name IS NULL THEN 0 else -1 end)<>(t.change_ci_name_c_key))x