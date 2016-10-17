SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdsdb.rm_enhancement_final i 
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c d ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
	WHERE (CASE
           WHEN (month(i.closed_at) > 6) THEN YEAR(i.closed_at)+1
           ELSE YEAR(i.closed_at) END )<>d.fiscal_year_closed_at
