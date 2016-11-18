SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from cardinalhealth_mdwdb.d_project d
JOIN cardinalhealth_mdsdb.pm_project_final i
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
join
cardinalhealth_mdwdb.d_internal_contact e 
ON (COALESCE(i.project_manager,'UNSPECIFIED')=RIGHT(e.row_id,32) AND e.current_flag='Y') 
where coalesce(e.row_key,case when i.project_manager is null then 0 else -1 end) <> d.manager_c_key