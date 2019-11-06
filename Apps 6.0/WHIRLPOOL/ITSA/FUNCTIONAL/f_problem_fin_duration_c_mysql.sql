SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.problem_final SRC 
LEFT JOIN whirlpool_mdwdb.f_problem TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
CASE 
 WHEN SRC.u_fin_duration  is null  THEN NULL   
 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_fin_duration ) < 0 THEN NULL    
 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_fin_duration ) > 214748364 THEN NULL     
 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_fin_duration ) end <> fin_duration_c
and SRC.CDCTYPE='X'