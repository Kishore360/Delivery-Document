SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_incident.last_reprioritized_on_key' ELSE 'SUCCESS' END as Message
from

-- select src.row_key,tgt.incident_key,coalesce(cal.row_key, 'a'),coalesce(tgt.last_reprioritized_on_key,'a')from
(select * from #DWH_TABLE_SCHEMA.d_incident where soft_deleted_flag='N') src
left join 
(select documentkey,sourceinstance,cdctype, max(DATE_FORMAT(CONVERT_TZ(sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'))  as last_updated_on from  extract_merge_mdsdb.sys_audit_final
where tablename='incident' and fieldname='priority'
group by 1,2,3)b 
on src.row_id=b.documentkey

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(b.last_updated_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.f_incident tgt
on src.row_key=tgt.incident_key
where coalesce(cal.row_key, 'a')<>coalesce(tgt.last_reprioritized_on_key,'a');
