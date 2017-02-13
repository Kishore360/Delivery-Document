SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.problem_final SRC
 LEFT JOIN cardinalhealth_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  cardinalhealth_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance

 )
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map LM
 on concat('STATE~PROBLEM~~~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~PROBLEM'
 
WHERE CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.closed_at,SRC.sys_updated_on)>coalesce( SRC.due_Date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,'GMT','America/New_York')
and SRC.due_date is not null and SRC.active=1)
 THEN 'Y' ELSE 'N' END <> TRGT.over_due_flag 