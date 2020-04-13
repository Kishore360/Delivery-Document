SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_caused_by_change.implemented_on_key' ELSE 'SUCCESS' END as Message 
from(select coalesce(cal.row_key,0),coalesce(TRGT.implemented_on_key,-1)
from 
(select * from  ge_mdsdb.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from ge_mdsdb.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from ge_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from ge_mdsdb.problem_final where cdctype<>'D' )prob
on prob.sys_id=inc.problem_id and prob.sourceinstance=inc.sourceinstance
left join (SELECT * FROM ge_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage
on inc.sys_id=outage.task_number and inc.sourceinstance=outage.sourceinstance
left join (select * from ge_mdwdb.d_calendar_date)cal 
on cal.row_id=date_format(convert_tz(coalesce(chg.work_start,chg.start_date,chg.closed_at),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on coalesce(outage.sys_id,inc.sys_id)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id
where UPPER(dimension_wh_code)='CLOSED' and coalesce(cal.row_key,0)<> coalesce(TRGT.implemented_on_key,-1)

union all

select coalesce(cal.row_key,0),coalesce(TRGT.implemented_on_key,-1)
from ( SELECT * FROM ge_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from ge_mdsdb.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from ge_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from ge_mdwdb.d_calendar_date)cal 
on cal.row_id=date_format(convert_tz(coalesce(chg.work_start,chg.start_date,chg.closed_at),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on outage.sys_id=TRGT.row_id and chg.sourceinstance=outage.sourceinstance
where UPPER(map.dimension_wh_code)='CLOSED' and coalesce(cal.row_key,0)<> coalesce(TRGT.implemented_on_key,-1))ca