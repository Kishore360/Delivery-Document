SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_project d
JOIN cardinalhealth_mdsdb.pm_project_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
join
cardinalhealth_mdwdb.d_lov h 
ON (i.state=h.dimension_code AND h.dimension_class='STATE~PM_PROJECT' AND h.current_flag='Y') 
where coalesce(h.row_key,case when i.state is null then 0 else -1 end) <> d.status_src_c_key	
;

