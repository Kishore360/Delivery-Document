select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.sys_audit_final SRC
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid)
left join <<tenant>>_mdwdb.f_case_activity TGT
on (SRC.sys_id = TGT.row_id AND SRC.sourceinstance = TGT.source_id)
where TGT.task_wh_type = 'sn_customerservice_case' and
concat(
COALESCE(SRC.sys_id, ''),
COALESCE(SRC.sourceinstance, ''),
COALESCE(NULL, ''),
COALESCE(NULL, ''),
COALESCE(SRC.sys_created_by, ''),
COALESCE(convert_tz(SRC.sys_created_on,L.source_time_zone,L.target_time_zone), ''),
COALESCE(SRC.fieldname, ''),
COALESCE(SRC.tablename, '')) <>
concat( 
COALESCE(TGT.row_id, ''),
COALESCE(TGT.source_id, ''),
COALESCE(TGT.changed_by, ''),
COALESCE(TGT.changed_on, ''),
COALESCE(TGT.created_by, ''),
COALESCE(TGT.created_on, ''),
COALESCE(TGT.task_attribute_wh_name, ''),
COALESCE(TGT.task_wh_type, ''));
