SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.pm_project_final b
join rei_mdwdb.d_project a
on
a.row_id = b.sys_id AND a.source_id=b.sourceinstance
join
rei_mdwdb.d_lov s
 on COALESCE(CONCAT('STATE~PM_PROJECT~~~',b.state),'UNSPECIFIED') =s.row_id  -- and b.sourceinstance= s.source_id 
where COALESCE(s.row_key,case when b.state is null then 0  else -1 end)<>a.project_state_src_key)a;
