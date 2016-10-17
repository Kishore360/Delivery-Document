SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM
						cardinalhealth_mdwdb.d_request_task d  
						JOIN cardinalhealth_mdsdb.sc_task_final i ON d.row_id=i.sys_id
	AND d.source_id=i.sourceinstance
						LEFT JOIN cardinalhealth_mdsdb.sc_req_item_final sri ON i.request_item=sri.sys_id
	AND sri.sourceinstance=i.sourceinstance
						LEFT JOIN cardinalhealth_mdsdb.sc_cat_item_final sci ON sri.cat_item=sci.sys_id
	AND sri.sourceinstance=sci.sourceinstance
	where d.item_type <> COALESCE(sci.name,'Assessments');
	
	