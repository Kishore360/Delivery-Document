SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_incident.caller_type' ELSE 'SUCCESS' END as Message  
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN (select EV.value,EV.sourceinstance,EV.value as rowid
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final EV
JOIN #MDS_TABLE_SCHEMA.hlx_field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId AND EV.sourceinstance = F.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final S ON (F.schemaId=S.schema_Id and F.sourceinstance = S.sourceinstance and S.overlaygroup=0) 
WHERE F.fieldName ='Contact Client Type' and S.NAME='hpd:help desk') call_type
ON (SRC.contact_client_type = call_type.rowid and SRC.sourceinstance = call_type.sourceinstance)
LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
ON (SRC.incident_number=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE( call_type.value,'UNSPECIFIED')<> COALESCE(TRGT.caller_type,'')