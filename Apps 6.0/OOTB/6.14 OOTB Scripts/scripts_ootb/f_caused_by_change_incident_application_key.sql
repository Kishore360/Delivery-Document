SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_caused_by_change.incident_application_key' ELSE 'SUCCESS' END as Message 
from(select coalesce(f_inc.application_key,0),coalesce(TRGT.incident_application_key,-1)
from 
(select * from  #MDS_TABLE_SCHEMA.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from #MDS_TABLE_SCHEMA.problem_final where cdctype<>'D' )prob
on prob.sys_id=inc.problem_id and prob.sourceinstance=inc.sourceinstance
left join (SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage
on inc.sys_id=outage.task_number and inc.sourceinstance=outage.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.f_incident where soft_deleted_flag='N')f_inc
on f_inc.row_id=(inc.sys_id) and f_inc.source_id=inc.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.f_caused_by_change where soft_deleted_flag='N')TRGT
on coalesce(outage.sys_id,inc.sys_id)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id
where UPPER(dimension_wh_code)='CLOSED' and coalesce(f_inc.application_key,0)<> coalesce(TRGT.incident_application_key,-1)

union all

select TRGT.incident_application_key,0
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from #DWH_TABLE_SCHEMA.f_caused_by_change where soft_deleted_flag='N')TRGT
on outage.sys_id=TRGT.row_id and chg.sourceinstance=outage.sourceinstance
where UPPER(map.dimension_wh_code)='CLOSED' and TRGT.incident_application_key<>0)ca