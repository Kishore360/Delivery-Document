SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_monitor_application.monitor_app_count' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.cdctype,TRGT.cdctype
 FROM 

(select 
CONCAT(checks.id,'~',check_tags.tagvalue)  as row_id
,checks.cdctype as cdctype
,D_MON.row_key as monitor_key
,D_APP.row_key as monitor_application_key
,CASE WHEN checks.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
,checks.sourceinstance as source_id
,count(*)as monitor_app_count
from #MDS_TABLE_SCHEMA.checks_final checks
left join #MDS_TABLE_SCHEMA.check_tags_final check_tags on
checks.id = check_tags.checkid 
and checks.sourceinstance = check_tags.sourceinstance
-- and check_tags.cdctype<>'D'
left outer join #DWH_TABLE_SCHEMA.d_monitor D_MON
on COALESCE(checks.id,'UNSPECIFIED')=D_MON.row_id
and D_MON.source_id=checks.sourceinstance
left outer join #DWH_TABLE_SCHEMA.d_application D_APP
on COALESCE(CONCAT('APPLICATION~',check_tags.tagvalue),'UNSPECIFIED')=D_APP.row_id
and D_APP.source_id=checks.sourceinstance
where /*checks.cdctype<>'D'
and*/ lower(check_tags.tagname) = 'application'
group by 1,2,3,4,5,6
)SRC

left outer join #DWH_TABLE_SCHEMA.f_monitor_application trgt
on SRC.row_id=trgt.row_id
and SRC.source_id=trgt.source_id
where coalesce(SRC.monitor_app_count, 'Unspecified')<>coalesce(trgt.monitor_app_count, 'Unspecified')
