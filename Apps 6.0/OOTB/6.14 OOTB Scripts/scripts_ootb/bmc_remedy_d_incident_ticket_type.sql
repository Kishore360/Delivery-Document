SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.description' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC

LEFT JOIN (select EV.value,EV.sourceinstance,EV.value as enumid
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final EV
JOIN #MDS_TABLE_SCHEMA.hlx_field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId AND EV.sourceinstance = F.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final S ON (F.schemaId=S.schema_Id and F.sourceinstance = S.sourceinstance and S.overlaygroup=0) 
WHERE F.fieldName ='TicketType' and S.NAME='hpd:help desk') tkt_type
ON SRC.tickettype = tkt_type.enumid and SRC.sourceinstance = tkt_type.sourceinstance

LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
ON (SRC.incident_number=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE( tkt_type.value,'')<> COALESCE(TRGT.ticket_type,'')

