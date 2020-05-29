SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final  SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_incident_activity TRGT 
ON (SRC.sys_id =TRGT.row_id 
AND SRC.sourceinstance= TRGT.source_id)
WHERE TRGT.incident_key <> -1 and TRGT.primary_sequence_id <>0 and CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
union 
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = TGT.incident_key
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
where TGT.incident_key <> -1 and TGT.primary_sequence_id = 0 and D.soft_deleted_flag = 'N' and COALESCE(F.soft_deleted_flag,'') <> COALESCE(TGT.soft_deleted_flag ,'')
) SQ