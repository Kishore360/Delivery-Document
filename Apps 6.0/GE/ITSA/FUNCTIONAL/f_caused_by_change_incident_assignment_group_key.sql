SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_caused_by_change.incident_assignment_group_key' ELSE 'SUCCESS' END as Message 
from(select 
coalesce(concat(inc.sys_id,'~',coalesce(inc.caused_by,'UNSPECIFIED'),'~',coalesce(inc.problem_id,'UNSPECIFIED'),'~',coalesce(outage.sys_id,'UNSPECIFIED')),'') ,coalesce(TRGT.row_id,'') from 
(select * from  ge_mdsdb.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from ge_mdsdb.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from ge_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from ge_mdsdb.problem_final where cdctype<>'D' )prob
on prob.sys_id=inc.problem_id and prob.sourceinstance=inc.sourceinstance
left join (SELECT * FROM ge_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage
on inc.sys_id=outage.task_number and inc.sourceinstance=outage.sourceinstance
LEFT JOIN ge_mdwdb.d_internal_organization int_org
ON coalesce(concat('GROUP~',inc.assignment_group),'UNSPECIFIED') = int_org.row_id  AND inc.sourceinstance = int_org.source_id
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on coalesce(outage.sys_id,inc.sys_id)=TRGT.row_id
and inc.sourceinstance=TRGT.source_id
where UPPER(dimension_wh_code)='CLOSED' and coalesce(int_org.row_key,case when inc.assignment_group is null then 0 else -1 end)<> coalesce(TRGT.incident_assignment_group_key,'')

union all

select coalesce(outage.sys_id,''),coalesce(TRGT.row_id,'')
FROM ( SELECT * FROM ge_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from ge_mdsdb.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from ge_mdwdb.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (select * from ge_mdwdb.f_caused_by_change where soft_deleted_flag='N')TRGT
on outage.sys_id=TRGT.row_id and chg.sourceinstance=outage.sourceinstance
where UPPER(map.dimension_wh_code)='CLOSED' and TRGT.incident_assignment_group_key<>0)ca