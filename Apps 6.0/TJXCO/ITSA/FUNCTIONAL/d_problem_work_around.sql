 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.work_around' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM tjxco_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN tjxco_mdsdb.sys_journal_field_final ref 
 ON (SRC.sys_id=ref.element_id and name='problem' and element='work_around') 
 WHERE COALESCE( ref.value,'')<>TRGT.work_around ;
