SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_caused_by_change.within_application_flag' ELSE 'SUCCESS' END as Message 
from 
(select (case when (inc.cmdb_ci=chg.cmdb_ci) then 'Y' else 'N' end),coalesce(TRGT.within_application_flag,'') from 
(select * from  #MDS_TABLE_SCHEMA.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from crp_69_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from crp_69_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on concat(inc.caused_by,'~',inc.sys_id,'~',case when (inc.cmdb_ci=chg.cmdb_ci) then 'Y' else 'N' end)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id 
where UPPER(map.dimension_wh_code)='CLOSED' and (case when (inc.cmdb_ci=chg.cmdb_ci) then 'Y' else 'N' end)<> coalesce(TRGT.within_application_flag,''))inc
union all
-- problem
select (case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=prob.cmdb_ci) then 'Y' else 'N' end),coalesce(TRGT.within_application_flag,'')
from(select * from  #MDS_TABLE_SCHEMA.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from #MDS_TABLE_SCHEMA.problem_final where cdctype<>'D' )prob
on prob.sys_id=inc.problem_id and prob.sourceinstance=inc.sourceinstance
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from crp_69_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from crp_69_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on concat(chg.sys_id,'~',prob.sys_id,'~',case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=prob.cmdb_ci) then 'Y' else 'N' end)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id 
where UPPER(map.dimension_wh_code)='CLOSED' and (case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=prob.cmdb_ci) then 'Y' else 'N' end)<> coalesce(TRGT.within_application_flag,'')

union all
-- direct outage 
select (case when (chg.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end),coalesce(TRGT.within_application_flag,'')
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from crp_69_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from crp_69_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on concat(chg.sys_id,'~',outage.sys_id,'~',case when (chg.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end)=TRGT.row_id
where UPPER(map.dimension_wh_code)='CLOSED' and (case when (chg.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end)<> coalesce(TRGT.within_application_flag,'')

union all 
-- outage via incident
select (case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end),coalesce(TRGT.within_application_flag,'')
FROM 
(select * from #MDS_TABLE_SCHEMA.incident_final where cdctype<>'D' and caused_by is not null)inc
inner join (SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage
on inc.sys_id=outage.task_number and inc.sourceinstance=outage.sourceinstance 
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D')chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from crp_69_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from crp_69_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on concat(chg.sys_id,'~',outage.sys_id,'~',case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end)=TRGT.row_id
where UPPER(map.dimension_wh_code)='CLOSED' and (case when (chg.cmdb_ci=inc.cmdb_ci and inc.cmdb_ci=outage.cmdb_ci) then 'Y' else 'N' end)<> coalesce(TRGT.within_application_flag,'');