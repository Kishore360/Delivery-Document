

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
WHERE lm.dimension_class = 'STATE~PROBLEM' AND 
CASE WHEN lm.dimension_wh_code <> 'CLOSED' THEN NULL 
    ELSE
      CASE WHEN SRC.opened_at <= SRC.closed_at then COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, SRC.closed_at) ,'')
      else NULL end END
 <> COALESCE(TRGT.open_to_close_duration ,'')
