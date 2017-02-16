SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.problem_final SRC
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~PROBLEM' )
 LEFT JOIN cardinalhealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(COALESCE( SRC.closed_at,SRC.sys_updated_on),source_time_zone,target_time_zone),'%Y%m%d') 
	and LKP.source_id=0)
WHERE CASE WHEN L.dimension_wh_code='CLOSED' THEN COALESCE(LKP.row_key,0) ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,''))temp;

