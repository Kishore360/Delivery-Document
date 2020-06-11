SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_caused_by_change.row_count' ELSE 'SUCCESS' END as Message
from (select * from (select sourceinstance,sum(inc_count) as SRC_COUNT from 
(select * from
(select count(inc.sys_id) as inc_count,chg.sourceinstance from 
(select * from  #MDS_TABLE_SCHEMA.incident_final where cdctype<>'D' and caused_by is not null ) inc
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D' ) chg
on inc.caused_by=chg.sys_id and inc.sourceinstance=chg.sourceinstance and inc.opened_at>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
left join (SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage
on inc.sys_id=outage.task_number and inc.sourceinstance=outage.sourceinstance
where UPPER(dimension_wh_code)='CLOSED')incident_related

union all

(select count(*)  as inc_count,chg.sourceinstance
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') outage 
inner join (select * from #MDS_TABLE_SCHEMA.change_request_final where cdctype<>'D')chg
on outage.task_number=chg.sys_id and outage.sourceinstance=chg.sourceinstance and outage.begin>=coalesce(chg.work_start,chg.start_date,chg.closed_at)
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
ON CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(chg.state)) = map.row_id and chg.sourceinstance=map.source_id
where UPPER(dimension_wh_code)='CLOSED'
)
)temp
group by 1)SRC,
(select source_id,count(*) as TRGT_COUNT from #DWH_TABLE_SCHEMA.f_caused_by_change where soft_deleted_flag='N')TRGT
where SRC.SRC_COUNT <> TRGT.TRGT_COUNT and  SRC.sourceinstance=TRGT.source_id
)SQ;