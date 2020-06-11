SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_change_request_activity' 
ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request_activity TRGT 
ON (SRC.sys_id  =TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE TRGT.change_request_key <> -1 and 
TRGT.primary_sequence_id <>0 and COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'N') <> COALESCE(TRGT.soft_deleted_flag ,'')
union 
select TGT.row_id
from (SELECT * FROM #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on concat(TGT.task_wh_type,'~',TGT.task_attribute_wh_name,'~',SRC.documentkey,'~0') = TGT.row_id and SRC.sourceinstance=TGT.source_id
left join #DWH_TABLE_SCHEMA.f_change_request F 
on F.change_request_key = TGT.change_request_key
and F.soft_deleted_flag = 'N'
where TGT.change_request_key <> -1 and TGT.primary_sequence_id = 0 and COALESCE(F.soft_deleted_flag,'') <> COALESCE(TGT.soft_deleted_flag ,'')
) SQ