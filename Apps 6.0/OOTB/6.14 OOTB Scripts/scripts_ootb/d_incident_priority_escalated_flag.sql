 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 -- select SRC.sys_id,SRC.priority , TA.oldvalue

 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 

left join 

(
select 
TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname,min(TA.record_checkpoint) as mini,max(TA.record_checkpoint)  as maxi
from  ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D')  TA
where TA.tablename = 'incident' 
AND TA.fieldname =  'priority' 
group by TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname
)base
on SRC.sys_id  =base.documentkey  
 AND SRC.sourceinstance = base.sourceinstance  

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') TA 
 ON (base.documentkey  =TA.documentkey  
 AND base.sourceinstance = TA.sourceinstance 
 and base.tablename=TA.tablename
 and base.fieldname=TA.fieldname
 and base.mini=TA.record_checkpoint
  )

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') TA1 
 ON (base.documentkey  =TA1.documentkey  
 AND base.sourceinstance = TA1.sourceinstance 
 and base.tablename=TA1.tablename
  and base.fieldname=TA1.fieldname
  and base.maxi=TA1.record_checkpoint
  )
  
  LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
where coalesce(CASE WHEN TA.oldvalue IS NOT NULL AND SRC.priority IS NOT NULL   
AND  SRC.priority < TA.oldvalue
THEN 'Y' ELSE 'N' end,'N' )<>coalesce(TRGT.priority_escalated_flag,'');
