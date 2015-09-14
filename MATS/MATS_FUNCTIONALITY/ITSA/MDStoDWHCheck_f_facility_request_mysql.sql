


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between facilities_final and f_facilty_request' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.facilities_final S
JOIN app_test.lsm_ls_source_timezone L
ON(S.sourceinstance  =   L.sourceid )
LEFT JOIN d_party DPV
ON (DPV.row_id   =  CONCAT('INTERNAL_CONTACT~',S.assigned_to) )
LEFT JOIN d_internal_organization DIO_AG
ON (DIO_AG.row_id   =  S.assignment_group 
and DIO_AG.group_flag = 'Y')
LEFT JOIN d_internal_organization DIO_C
ON (DIO_C.row_id   =  S.company )
LEFT JOIN d_configuration_item DCI
ON (DCI.row_id   =  S.cmdb_ci )
LEFT JOIN d_domain DD
ON (DD.row_id   =  S.sys_domain )
LEFT JOIN d_location DL
ON (DL.row_id   =  S.location )
join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_number) from o_data_freshness))
JOIN d_facility_request DFR
ON(DFR.row_id= S.sys_id )
WHERE CRC32(CONCAT(
COALESCE(DPV.row_key,CASE WHEN S.assigned_to IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DIO_AG.row_key,CASE WHEN S.assignment_group IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DIO_C.row_key,CASE WHEN S.company IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DCI.row_key,CASE WHEN S.cmdb_ci IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DD.row_key,CASE WHEN S.sys_domain IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DL.row_key,CASE WHEN S.location IS NOT NULL THEN -1 ELSE 0 END),
IFNULL(TIMESTAMPDIFF(DAY,convert_tz(S.opened_at,source_time_zone,target_time_zone),RH.start_time),''),
IFNULL(DFR.row_key,''),
IFNULL(S.approval,''),
IFNULL(S.category,''),
IFNULL(S.impact,''),
IFNULL(S.priority,''),
IFNULL(S.reassignment_count,''),
IFNULL(S.sourceinstance,''),
IFNULL(S.state,''),
IFNULL(S.subcategory,''),
IFNULL(S.sys_created_by,''),
IFNULL(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
IFNULL(S.sys_id,''),
IFNULL(S.sys_updated_by,''),
IFNULL(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
IFNULL(S.urgency,''),
IFNULL(TIMESTAMPDIFF(SECOND,S.opened_at,S.closed_at),''), 
IFNULL(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.time_worked),'')
)) NOT IN (
SELECT CRC32(CONCAT(IFNULL(DWH.assigned_to_key,''),
IFNULL(DWH.assignment_group_key,''),
IFNULL(DWH.company_key,''),
IFNULL(DWH.configuration_item_key,''),
IFNULL(DWH.domain_key,''),
IFNULL(DWH.location_key,''),
IFNULL(DWH.age,''),
IFNULL(DWH.facility_request_key,''),
IFNULL(DWH.approval_state_src_code,''),
IFNULL(DWH.category_src_code,''),
IFNULL(DWH.impact_src_code,''),
IFNULL(DWH.priority_src_code,''),
IFNULL(DWH.reassignment_count,''),
IFNULL(DWH.source_id,''),
IFNULL(DWH.state_src_code,''),
IFNULL(DWH.sub_category_src_code,''),
IFNULL(DWH.created_by,''),
IFNULL(DWH.created_on,''),
IFNULL(DWH.row_id,''),
IFNULL(DWH.changed_by,''),
IFNULL(DWH.changed_on,''),
IFNULL(DWH.urgency_src_code,''),
IFNULL(DWH.open_to_close_duration,''),
IFNULL(DWH.time_worked,''))) FROM <<tenant>>_mdwdb.f_facility_request DWH)

