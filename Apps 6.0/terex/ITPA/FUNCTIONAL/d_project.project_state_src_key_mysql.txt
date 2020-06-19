
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_project.project_state_src_key' ELSE 'SUCCESS' END as Message

FROM 
( Select Count(1) as CNT
FROM  terex_mdsdb.pv_projects_final SRC 
LEFT JOIN terex_mdwdb.d_project TRGT
ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN terex_mdwdb.d_lov LKP ON
coalesce(CONCAT('PROJECT~STATE~',SRC.ScoreCard_Status),
                'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.ScoreCard_Status iS NULL THEN 0 ELSE -1 END)<>TRGT.project_state_src_key

AND TRGT.soft_deleted_flag='N' ) temp;
