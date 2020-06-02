SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_resolve_duration' ELSE 'SUCCESS' END as Message
FROM 
#DWH_TABLE_SCHEMA.d_case SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT
ON SRC.row_id=TRGT.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 ON (TRGT.state_src_key=LM.src_key
 AND TRGT.source_id=LM.source_id AND LM.dimension_class = 'STATE~CASE')
WHERE 
CASE WHEN coalesce(LM.dimension_wh_code, '') not in ('CLOSED', 'RESOLVED') THEN NULL ELSE
COALESCE(case when SRC.opened_on <= coalesce(SRC.last_resolved_on,SRC.closed_on,SRC.changed_on)
then TIMESTAMPDIFF(SECOND, convert_tz(SRC.opened_on, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'), 
convert_tz(coalesce(SRC.last_resolved_on,SRC.closed_on,SRC.changed_on), '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
else null end,'') END
<> COALESCE(TRGT.open_to_resolve_duration ,'');