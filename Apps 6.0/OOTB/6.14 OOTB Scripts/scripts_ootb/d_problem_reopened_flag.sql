SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.reopened_flag' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_problem)TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
INNER join (select sum(reopen_count) as reopen_count,problem_id from #MDS_TABLE_SCHEMA.incident_final where  cdctype<>'D'
group by problem_id)SRC1
on SRC1.problem_id=TRGT.row_id
WHERE COALESCE(case when SRC1.reopen_count >0 then 'Y' else 'N' end,'') <> COALESCE(TRGT.reopened_flag,'')


