SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_enhancement_final i 
LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm f ON i.sys_id=f.row_id 
	AND i.sourceinstance=f.source_id 
	where COALESCE(i.state,0)<>f.state_src_code