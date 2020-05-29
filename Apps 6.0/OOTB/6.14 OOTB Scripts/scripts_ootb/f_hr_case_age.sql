
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.age' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_case_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left join #DWH_TABLE_SCHEMA.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
ON (TRGT.source_id = df.source_id)
 
where lm.dimension_class = 'STATE~HR_CASE'
and case when lm.dimension_wh_code in ('OPEN','AWAITING APPROVAL') then 
        case when coalesce( SRC.opened_at,0)> convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>') then 0 
        else TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) end
	else  
		case when  SRC.opened_at> coalesce( SRC.closed_at,0) then 0 
        else TIMESTAMPDIFF(DAY, coalesce( SRC.opened_at,0),coalesce( SRC.closed_at,0))
     end
end  <>TRGT.age
