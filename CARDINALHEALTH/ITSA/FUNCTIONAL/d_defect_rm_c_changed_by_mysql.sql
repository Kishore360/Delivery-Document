SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdsdb.rm_defect_final i 
JOIN cardinalhealth_mdwdb.d_defect_rm_c d ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
	WHERE i.sys_updated_by <>d.changed_by