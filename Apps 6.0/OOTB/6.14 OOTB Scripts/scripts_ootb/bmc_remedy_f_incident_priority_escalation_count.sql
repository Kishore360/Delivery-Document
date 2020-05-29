
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.priority_escalation_count' ELSE 'SUCCESS' END as Message
 
 FROM 
 (SELECT SRC.incident_number,SRC.sourceinstance,
 SUM(CASE WHEN old.enumid IS NOT NULL AND new.enumid IS NOT NULL   
AND  new.enumid < old.enumid
THEN 1 ELSE 0 END) AS priority_escalation_cnt
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 

 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') TA 
 ON (SRC.incident_number  =TA.documentkey  
 AND SRC.sourceinstance = TA.sourceinstance  
 AND TA.tablename = 'bmc_hpd_help_desk_sys_audit_final' 
AND TA.fieldname =  'priority')

left join (select EV.value,EV.sourceinstance,max(EV.enumId ) as enumid
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final EV
JOIN #MDS_TABLE_SCHEMA.hlx_field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId and EV.sourceinstance = F.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final S ON (F.schemaId=S.schemaId and F.sourceinstance = S.sourceinstance and S.overlaygroup=0)
WHERE  F.fieldName  ='priority'
and S.NAME='hpd:help desk' group by EV.value,EV.sourceinstance) old 
on TA.oldvalue = old.value and TA.sourceinstance = old.sourceinstance

left join (select EV.value,EV.sourceinstance,max(EV.enumId ) as enumid
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final EV
JOIN #MDS_TABLE_SCHEMA.hlx_field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId and EV.sourceinstance = F.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final S ON (F.schemaId = S.schemaId AND F.sourceinstance = S.sourceinstance)
WHERE  F.fieldName  ='priority'
and S.NAME='hpd:help desk' group by EV.value,EV.sourceinstance) new 
on TA.newvalue = new.value and TA.sourceinstance = new.sourceinstance



GROUP BY SRC.incident_number,SRC.sourceinstance
) SRCF

LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRCF.incident_number  =TRGT.row_id  
 AND SRCF.sourceinstance = TRGT.source_id  )

 WHERE COALESCE(SRCF.priority_escalation_cnt ,'0')
 <> COALESCE(TRGT.priority_escalation_count ,'');
