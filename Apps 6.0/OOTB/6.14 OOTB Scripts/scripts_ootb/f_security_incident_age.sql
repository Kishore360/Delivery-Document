SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_incindet.age' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_security_incident TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGTD
ON TRGTD.row_key = TRGT.security_incident_key

LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map lm 
ON (lm.src_key = TRGTD.state_src_key and lm.dimension_class = 'WH_AGEBUCKET~SECURITY_INC')
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
) df 
ON (TRGT.source_id = df.source_id)

where 
                case when (lm.dimension_wh_code = 'OPEN')  OR ( SRC.closed_at is NULL ) then 
                                case when coalesce(SRC.opened_at,0)> convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') then 0 
                                    else TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end
                else 
                                case when  SRC.opened_at>coalesce(SRC.closed_at,0) then 0 
                                     else TIMESTAMPDIFF(DAY,coalesce( SRC.opened_at,0),coalesce(SRC.closed_at,0))
                                end 
                end<>coalesce( TRGT.age,'')
                
