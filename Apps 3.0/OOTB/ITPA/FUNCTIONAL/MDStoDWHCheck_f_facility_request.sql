SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between #MDS_TABLE_NAME and f_facilty_request' ELSE 'SUCCESS' END AS Message 

-- select count(1)
fROM <<tenant>>_mdsdb.facilities_request_final S


-- AND S.source_instance = DWH.source_id 

JOIN app_test.lsm_ls_source_timezone L
ON(S.sourceinstance   =   L.sourceid )

LEFT JOIN <<tenant>>_mdwdb.d_internal_contact DPV
ON ((DPV.row_id    =  CONCAT('INTERNAL_CONTACT~',S.assigned_to) )
AND DPV.source_id = S.sourceinstance )

LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact LKP
 ON ( concat('INTERNAL_CONTACT~',S.opened_by) = LKP.row_id 
 AND S.sourceinstance = LKP.source_id )
 
 LEFT JOIN    <<tenant>>_mdwdb.d_internal_organization LKP1
 ON ( concat('DEPARTMENT~',LKP.department_code) = LKP1.row_id 
 AND LKP.source_id = LKP1.source_id )

LEFT JOIN <<tenant>>_mdwdb.d_internal_organization DIO_AG
ON (DIO_AG.row_id    =  CONCAT('GROUP~',S.assignment_group) 
and DIO_AG.group_flag = 'Y')
 /1
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization DIO_D
ON (DIO_D.row_id    =  CONCAT('DEPARTMENT~',S.department) )
 and LKP1.row_id  is null 1/
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization DIO_C
ON (DIO_C.row_id    =  CONCAT('SUBSIDIARY~',S.company) )
LEFT JOIN <<tenant>>_mdwdb.d_configuration_item DCI
ON (DCI.row_id    =  S.cmdb_ci )
LEFT JOIN <<tenant>>_mdwdb.d_domain DD
ON (DD.row_id    =  S.sys_domain )
LEFT JOIN <<tenant>>_mdwdb.d_location DL
ON (DL.row_id    =  S.location )
JOIN <<tenant>>_mdwdb.d_facility_request DFR
ON(DFR.row_id = S.sys_id )
WHERE CRC32(CONCAT(
COALESCE(DPV.row_key,CASE WHEN S.assigned_to IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DIO_AG.row_key,CASE WHEN S.assignment_group IS NOT NULL THEN -1 ELSE 0 END),
-- COALESCE(DIO_D.row_key,CASE WHEN S.department IS NOT NULL THEN -1 ELSE 0 END)
COALESCE(LKP1.row_key-- ,DIO_D.row_key
,CASE WHEN (S.opened_by is not null and LKP.department_code IS NULL  or S.opened_by is  null 
 )
 THEN 0 else '-1' end),
 COALESCE(DIO_C.row_key,CASE WHEN S.company IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DCI.row_key,CASE WHEN S.cmdb_ci IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DD.row_key,CASE WHEN S.sys_domain IS NOT NULL THEN -1 ELSE 0 END),
COALESCE(DL.row_key,CASE WHEN S.location IS NOT NULL THEN -1 ELSE 0 END),
IFNULL(TIMESTAMPDIFF(DAY,convert_tz(S.opened_at,source_time_zone,target_time_zone),Null),''),
IFNULL(DFR.row_key,''),
IFNULL(S.approval,''),
IFNULL(S.category,''),
IFNULL(S.impact,''),
IFNULL(S.priority,''),
IFNULL(S.reassignment_count,''),
IFNULL(S.sourceinstance,''),
IFNULL(S.state,''),
IFNULL(null,''),
IFNULL(S.sys_created_by,''),
IFNULL(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
IFNULL(S.sys_id,''),
IFNULL(S.sys_updated_by,''),
IFNULL(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''),
IFNULL(S.urgency,''),

IFNULL(TIMESTAMPDIFF(SECOND,S.opened_at,S.closed_at),''), 
IFNULL(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',S.time_worked),'')
) ) NOT IN (
SELECT CRC32(CONCAT(IFNULL(DWH.assigned_to_key,''),
IFNULL(DWH.assignment_group_key,''),
 IFNULL(DWH.opened_by_department_key,''),
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
IFNULL(DWH.time_worked,'')) ) FROM <<tenant>>_mdwdb.f_facility_request DWH)
