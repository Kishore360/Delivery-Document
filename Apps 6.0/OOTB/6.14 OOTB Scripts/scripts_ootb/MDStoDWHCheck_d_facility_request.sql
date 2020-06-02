
SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between facilities_request_final and d_facilty_request' ELSE 'SUCCESS - Dormant key is disabled in SQLCODE' END AS Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.facilities_request_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_facility_request TRGT
on S.sys_id=TRGT.row_id
LEFT JOIN  #DWH_TABLE_SCHEMA.f_facility_request TRGTF 
 ON (TRGTF.facility_request_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on (TRGTF.state_src_key = LM.src_key and LM.dimension_class='STATE~TASK')
LEFT JOIN #DWH_TABLE_SCHEMA.d_o_data_freshness FRESH  ON(FRESH.source_id=S.sourceinstance) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_domain DMN
ON (DMN.row_id   = S.sys_domain 
)
LEFT JOIN #DWH_TABLE_SCHEMA.f_request_activity TA 
ON ( S.sys_id = TA.task_row_id  
and S.sourceinstance  = TA.source_id 
and TA.task_wh_type = 'sc_request' 
and TA.task_attribute_wh_name ='priority' 
and TA.task_attribute_wh_old_value is not null 
and TA.task_attribute_wh_new_value is not null
and  TA.task_attribute_wh_new_value < TA.task_attribute_wh_old_value )

LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fpv_element_final WHERE CDCTYPE<>'D') fpv on S.room=fpv.sys_id and S.SourceInstance=fpv.SourceInstance
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.cmn_building_final WHERE CDCTYPE<>'D') cmn on fpv.building=cmn.sys_id and fpv.SourceInstance=cmn.SourceInstance
WHERE CRC32(CONCAT(
IFNULL(S.sys_id,''),
IFNULL(S.sourceinstance,''),
IFNULL(S.number,''),
IFNULL(convert_tz(S.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(convert_tz(S.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(convert_tz(S.due_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
'N',
CASE WHEN TA.row_id IS NOT NULL THEN 'Y' ELSE 'N' END,
CASE WHEN TIMESTAMPDIFF(MINUTE,S.opened_at,S.closed_at)<30 THEN 'Y' ELSE 'N' END,
CASE WHEN S.made_sla =1 then 'Y' else 'N' END,
CASE WHEN S.active =1 then 'Y' else 'N' END,
COALESCE(DMN.row_key, -1),
CASE WHEN S.reassignment_count >1 THEN 'Y' ELSE 'N' END,
IFNULL(S.reassignment_count,''),
-- COALESCE(CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30
-- AND  LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END ,''),
IFNULL(S.short_description,''),
IFNULL(S.description,''),
CASE WHEN S.knowledge=1 then 'Y'  else 'N' END,
IFNULL(convert_tz(S.expected_start,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(convert_tz(S.work_start,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(convert_tz(S.work_end,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(fpv.name,''),
IFNULL(cmn.name,''),
COALESCE( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END ,''),
IFNULL(S.sys_created_by,''),
IFNULL(S.sys_updated_by,''),
IFNULL(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),''),
IFNULL(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
) ) 
 NOT IN (
SELECT CRC32(CONCAT(
IFNULL(DWH.row_id,''),
IFNULL(DWH.source_id,''),
IFNULL(DWH.facility_request_number,''),
IFNULL(DWH.opened_on,''),
IFNULL(DWH.closed_on,''),
IFNULL(DWH.due_on,''),
IFNULL(DWH.over_due_flag,''),
IFNULL(DWH.priority_escalated_flag,''),
IFNULL(DWH.first_call_resolution_flag,''),
IFNULL(DWH.met_sla_flag,''),
IFNULL(DWH.active_flag,''),
IFNULL(DWH.domain_key,''),
IFNULL(DWH.multiple_assignment_flag,''),
IFNULL(DWH.reassignment_count,''),
-- IFNULL(DWH.dormant_flag,''),
IFNULL(DWH.short_description,''),
IFNULL(DWH.description,''),
IFNULL(DWH.knowledge_flag,''),
IFNULL(DWH.expected_start,''),
IFNULL(DWH.work_start,''),
IFNULL(DWH.work_end,''),
IFNULL(DWH.room_number,''),
IFNULL(DWH.building,''),
IFNULL(DWH.backlog_flag,''),
IFNULL(DWH.created_by,''),
IFNULL(DWH.changed_by,''),
IFNULL(DWH.created_on,''),
IFNULL(DWH.changed_on,'')
) ) FROM #DWH_TABLE_SCHEMA.d_facility_request DWH)
