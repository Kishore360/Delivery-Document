SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.short_desc' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.problem_final SRC 
 LEFT JOIN gilead_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.u_root_cause_description,'UNSPECIFIED')<> TRGT.root_cause_description_c