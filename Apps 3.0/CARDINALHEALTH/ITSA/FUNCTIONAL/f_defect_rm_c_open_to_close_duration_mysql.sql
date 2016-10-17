SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdwdb.f_defect_rm_c d
JOIN cardinalhealth_mdsdb.rm_defect_final i ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
where TIMESTAMPDIFF(SECOND,i.opened_at,i.closed_at) <> d.open_to_close_duration