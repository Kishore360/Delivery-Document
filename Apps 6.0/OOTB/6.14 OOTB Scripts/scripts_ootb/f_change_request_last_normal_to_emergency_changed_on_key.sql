SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.last_normal_to_emergency_changed_on_key' 
ELSE 'SUCCESS' END as Message
-- (select SRC.sys_id,sa.documentkey,sa.created_date
FROM 
(SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
left join (select documentkey,oldvalue,newvalue,max(sys_created_on) as created_date from #MDS_TABLE_SCHEMA.sys_audit_final 
where fieldname = 'type' and tablename = 'change_request'
and upper(oldvalue) = 'NORMAL' and upper(newvalue) = 'EMERGENCY'
group by documentkey) sa
on sa.documentkey = SRC.sys_id
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
left join #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(sa.created_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
WHERE coalesce(LKP.row_key,'')<> coalesce(TRGT.last_normal_to_emergency_changed_on_key,'');