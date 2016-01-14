SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.dormant_flag' ELSE 'SUCCESS' END as Message

FROM rei_mdsdb.problem_final SRC 

 LEFT JOIN rei_mdwdb.d_problem TRGT 
 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
LEFT JOIN rei_mdwdb.f_problem TRGTF
 
ON (TRGTF.problem_key =TRGT.row_key  
 AND TRGTF.source_id= TRGT.source_id  )

 
LEFT JOIN rei_mdwdb.d_lov_map LM 
ON TRGTF.state_src_key=LM.src_key

WHERE 
CASE WHEN timestampdiff(DAY,TRGT.changed_on,(SELECT MAX(lastupdated) AS lastupdated
FROM rei_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>14 
AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.dormant_flag ,'');
