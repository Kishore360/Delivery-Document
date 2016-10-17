SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdwdb.d_request_task d
JOIN cardinalhealth_mdsdb.sc_task_final i ON d.row_id=i.sys_id
	AND d.source_id=i.sourceinstance
	where d.short_description <> CASE 
							WHEN LENGTH(i.short_description)>255 THEN REPLACE(CONVERT(i.short_description USING ASCII),'?','') 
							ELSE i.short_description END;