SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

select count(*)
from cardinalhealth_mdwdb.d_project d
JOIN cardinalhealth_mdsdb.pm_project_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
join
cardinalhealth_mdwdb.d_lov g 
ON (i.priority=g.dimension_code AND g.dimension_class='PRIORITY~PM_PROJECT' AND g.current_flag='Y') 
where coalesce(g.row_key,case when i.priority is null then 0 else -1 end) <> d.priority_src_c_key