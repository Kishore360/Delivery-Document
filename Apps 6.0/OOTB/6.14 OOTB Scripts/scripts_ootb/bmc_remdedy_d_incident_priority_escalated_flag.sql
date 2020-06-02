SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.priority_escalated_flag' ELSE 'SUCCESS' END as Message

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 

left join 
(select 
TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname,min(TA.sys_created_on) as mini
from  ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D')  TA
where TA.tablename = 'hpd_help_desk' 
AND TA.fieldname =  'priority' 
group by TA.documentkey, TA.sourceinstance,TA.tablename ,TA.fieldname
)base
on SRC.incident_number  =base.documentkey  
AND SRC.sourceinstance = base.sourceinstance  

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') TA 
 ON (base.documentkey  =TA.documentkey  
 AND base.sourceinstance = TA.sourceinstance 
 and base.tablename=TA.tablename
 and base.fieldname=TA.fieldname
 and base.mini=TA.sys_created_on
  )

  
left join (select EV.value,EV.sourceinstance,max(EV.enumId ) as enumid
FROM #MDS_TABLE_SCHEMA.bmc_field_enum_values_final EV
JOIN #MDS_TABLE_SCHEMA.bmc_field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId and EV.sourceinstance = F.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.bmc_arschema_final S ON (F.schemaId=S.schemaId and F.sourceinstance = S.sourceinstance and S.overlaygroup=0)
WHERE  F.fieldName  ='priority'
and S.NAME='hpd:help desk' group by EV.value,EV.sourceinstance) minval 
on TA.oldvalue = minval.value and TA.sourceinstance = minval.sourceinstance


LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 
where coalesce(CASE WHEN minval.enumid IS NOT NULL AND SRC.priority IS NOT NULL   
AND  SRC.priority < minval.enumid
THEN 'Y' ELSE 'N' end,'N' )<>coalesce(TRGT.priority_escalated_flag,'');
