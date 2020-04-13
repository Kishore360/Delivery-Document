SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_caused_by_change.configuration_item_key' ELSE 'SUCCESS' END as Message 
from(select coalesce(app.row_key,case when chg.cmdb_ci is null then 0 else -1 end)<> coalesce(TRGT.configuration_item_key,'')
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
left join (select * from ge_mdwdb.d_configuration_item where soft_deleted_flag='N')app
on app.row_id=coalesce(chg.cmdb_ci,'UNSPECIFIED') and app.source_id=chg.sourceinstance
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on coalesce(outage.sys_id,inc.sys_id)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id
where UPPER(dimension_wh_code)='CLOSED' and coalesce(app.row_key,case when chg.cmdb_ci is null then 0 else -1 end)<> coalesce(TRGT.configuration_item_key,'')

union all

select coalesce(app.row_key,case when chg.cmdb_ci is null then 0 else -1 end)<> coalesce(TRGT.configuration_item_key,'')
from ( SELECT * FROM ge_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from ge_mdsdb.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from ge_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from ge_mdwdb.d_configuration_item where soft_deleted_flag='N')app
on app.row_id=coalesce(chg.cmdb_ci,'UNSPECIFIED') and app.source_id=chg.sourceinstance
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on outage.sys_id=TRGT.row_id and chg.sourceinstance=outage.sourceinstance
where UPPER(map.dimension_wh_code)='CLOSED' and coalesce(app.row_key,case when chg.cmdb_ci is null then 0 else -1 end)<> coalesce(TRGT.configuration_item_key,''))ca