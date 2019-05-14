SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.closed_by_key' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) cnt from 
(SELECT coalesce(LKP.row_key,case when SRC.closed_by is null  THEN 0 ELSE -1 end) source,TRGT.closed_by_key TARGT
FROM cardinalhealth_mdsdb.problem_final SRC 
JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code  )
  JOIN cardinalhealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP 
ON ( SRC.closed_by = substring(LKP.row_id,18,length(LKP.row_id))  AND SRC.sourceinstance = LKP.source_id )	

WHERE L.dimension_wh_code='CLOSED' and  LKP.soft_deleted_flag='N' and  TRGT.soft_deleted_flag='N' and L.dimension_class = 'STATE~PROBLEM'  
)temp where source<>TARGT)a;
