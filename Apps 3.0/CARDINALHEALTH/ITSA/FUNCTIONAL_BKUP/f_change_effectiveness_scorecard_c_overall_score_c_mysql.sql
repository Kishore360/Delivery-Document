SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for f_change_effectiveness_scorecard_c.overall_score_c'
ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdwdb.f_change_effectiveness_scorecard_c a11
JOIN cardinalhealth_mdsdb.u_change_effectiveness_scorecard_final a12 
ON a11.row_id = a12.sys_id AND a11.source_id = a12.sourceinstance
WHERE  overall_score_c <> overall_score_c;