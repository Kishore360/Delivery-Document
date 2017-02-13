SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for f_change_effectiveness_scorecard_c.overall_rating_c_key'
ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdwdb.f_change_effectiveness_scorecard_c a11
JOIN cardinalhealth_mdsdb.u_change_effectiveness_scorecard_final a12 
ON a11.row_id = a12.sys_id AND a11.source_id = a12.sourceinstance
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
ON CONCAT('OVERALL_RATING_C~CHANGE_SCORE_CARD~~~',UPPER(a12.u_overall_rating)) = LKP.row_id AND a12.sourceinstance = LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a12.u_overall_rating IS NULL THEN 0 ELSE -1 END) <> a11.overall_rating_c_key;