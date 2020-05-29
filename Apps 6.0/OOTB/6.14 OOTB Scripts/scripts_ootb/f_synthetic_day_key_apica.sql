SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_synthetic.day_key' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.cdctype,TRGT.cdctype
  FROM 

(select 
CONCAT(check_results.check_id,'~',check_results.timestamp_utc)  as row_id
,check_results.cdctype as cdctype

,D_DAT.row_key as day_key
,CASE WHEN check_results.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
,check_results.sourceinstance as source_id
-- ,D_TIM.row_key as time_key
from #MDS_TABLE_SCHEMA.check_results_final check_results
left join #MDS_TABLE_SCHEMA.check_tags_final check_tags on
check_results.check_id = check_tags.checkid 
and check_results.sourceinstance = check_tags.sourceinstance
and check_tags.cdctype<>'D'
left join #MDS_TABLE_SCHEMA.checks_final checks on 
check_results.check_id = checks.id 
and check_results.sourceinstance = checks.sourceinstance
and checks.cdctype<>'D'
left outer join #DWH_TABLE_SCHEMA.d_calendar_date D_DAT
on COALESCE(DATE_FORMAT(CONVERT_TZ(check_results.timestamp_utc, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'UNSPECIFIED')=D_DAT.row_id
where check_results.cdctype<>'D'
)SRC

left outer join #DWH_TABLE_SCHEMA.f_synthetic trgt
on SRC.row_id=trgt.row_id
and SRC.source_id=trgt.source_id
where SRC.day_key<>trgt.day_key
-- select * from #DWH_TABLE_SCHEMA.d_application
-- select distinct soft_deleted_flag from #DWH_TABLE_SCHEMA.f_synthetic limit 100;

-- select distinct cdctype from #MDS_TABLE_SCHEMA.check_results_final limit 100;