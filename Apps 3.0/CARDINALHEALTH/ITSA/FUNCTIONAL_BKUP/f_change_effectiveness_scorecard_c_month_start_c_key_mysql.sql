SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for f_change_effectiveness_scorecard_c.month_start_c_key'
ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdwdb.f_change_effectiveness_scorecard_c a11
JOIN cardinalhealth_mdsdb.u_change_effectiveness_scorecard_final a12 
ON a11.row_id = a12.sys_id AND a11.source_id = a12.sourceinstance
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP
ON DATE_FORMAT(a12.u_year_start_period,'%Y%m%d') = LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN a12.u_year_start_period IS NULL THEN 0 ELSE -1 END) <> a11.month_start_c_key;