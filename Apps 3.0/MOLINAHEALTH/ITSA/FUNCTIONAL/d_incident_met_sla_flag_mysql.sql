SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message from (
 select 
case when timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))>=coalesce(LKP.lower_range_value,-99) AND timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))<=coalesce(LKP.upper_range_value,-99) 
 and  LKP.dimension_code='Sev1' then  'Y'
when timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))>=coalesce(LKP.lower_range_value,-99) AND timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))<=coalesce(LKP.upper_range_value,-99) 
AND LKP.dimension_code='Sev2' then  'Y'
when timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))>=coalesce(LKP.lower_range_value,-99) AND timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))<=coalesce(LKP.upper_range_value,-99) 
 AND  LKP.dimension_code='Sev3' then  'Y'
when timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))>=coalesce(LKP.lower_range_value,-99) AND timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))<=coalesce(LKP.upper_range_value,-99) 
 and  LKP.dimension_code='Sev4' then  'Y'
when timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))>=coalesce(LKP.lower_range_value,-99) AND timestampdiff(second,opened_at,coalesce(resolved_at,closed_at))<=coalesce(LKP.upper_range_value,-99) 
 and  LKP.dimension_code='Sev5' then  'Y'
else 'N' end met_sla_flag_src, met_sla_flag

FROM molinahealth_mdsdb.incident_final SRC
LEFT JOIN molinahealth_mdwdb.d_lov_map LKP_MAP 
 ON LKP_MAP.src_rowid=CONCAT('PRIORITY~TASK~~~',SRC.priority)
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
ON LKP.dimension_code=LKP_MAP.dimension_wh_code
LEFT JOIN molinahealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 where state in (4)
 )a where met_sla_flag_src<>met_sla_flag

