SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message from (
 select 
 case when timestampdiff(second,opened_at,resolved_at)<=7200 and  LKP.dimension_code='Sev1' then  'Y'
when timestampdiff(second,opened_at,resolved_at)<=14400 and  LKP.dimension_code='Sev2' then  'Y'
when timestampdiff(second,opened_at,resolved_at)<=28800 and  LKP.dimension_code='Sev3' then  'Y'
when timestampdiff(second,opened_at,resolved_at)<=86400 and  LKP.dimension_code='Sev4' then  'Y'
when timestampdiff(second,opened_at,resolved_at)<=259200 and  LKP.dimension_code='Sev5' then  'Y'
else 'N' end met_sla_flag_src, met_sla_flag
 FROM molinahealth_mdsdb.incident_final SRC
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
ON  concat('PRIORITY_WH~INCIDENT~~~SEV',priority)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
LEFT JOIN molinahealth_mdwdb.d_lov_map LKP_MAP 
 ON LKP.dimension_class='PRIORITY_WH~INCIDENT' and 
( LKP_MAP.dimension_wh_code=LKP.dimension_code 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN molinahealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 )a
