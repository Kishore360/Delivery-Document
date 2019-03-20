SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message
 
 FROM cardinalhealth_mdsdb.incident_final SRC
 
  JOIN cardinalhealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 JOIN (
 select source_id,max(lastupdated) as lastupdated from  cardinalhealth_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance)

JOIN cardinalhealth_mdwdb.d_lov_map LM
 on concat('STATE~INCIDENT~~~',upper(SRC.incident_state) )= LM.src_rowid
 
 
WHERE LM.dimension_class='STATE~INCIDENT' and  TRGT.soft_deleted_flag='N' and
CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and 
coalesce( SRC.closed_at,SRC.sys_updated_on)>coalesce( SRC.due_date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,'GMT','America/New_York')
and SRC.due_date is not null and SRC.active=1)
 THEN 'Y' ELSE 'N' END <> TRGT.over_due_flag 
