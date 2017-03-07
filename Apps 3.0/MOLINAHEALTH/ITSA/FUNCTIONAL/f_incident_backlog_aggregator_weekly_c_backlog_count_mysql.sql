SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0  THEN 'MDS to DWH data validation failed for f_incident_backlog_aggregator_weekly_c' ELSE 'SUCCESS' END as Message 
FROM 
(select  
 d.name name,catalog_item user_input,dimension_name,aggregate_c_key,sum(backlog_count) trgt
from   molinahealth_mdwdb.f_incident_backlog_aggregator_weekly_c f
join  molinahealth_mdwdb.d_configuration_item d on d.row_key=configuration_item_key and d.source_id=f.source_id
join molinahealth_mdwdb.d_calendar_date   cd on aggregate_c_key=cd.row_key
inner join(select DATE_FORMAT(
DATE_ADD(SUBDATE(max(lastupdated), WEEKDAY(max(lastupdated))),interval 6  day)
,'%Y%m%d') 
AS refreshday,max(lastupdated) from molinahealth_mdwdb.d_o_data_freshness as df  ) as df
on cd.row_id = df.refreshday
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
 ON LKP.row_key=f.priority_src_key group by 1,2,3,4 order by 1,2,3,4)a
join
(
select -- c.name,user_input,priority,week_end_date_key,
c.name name,user_input user_input,sf.label,d.row_id week_end_date,count(1) src from molinahealth_mdsdb.incident_final i
join  molinahealth_mdwdb.d_calendar_date d on d.row_id =(select distinct  aggregate_c_key from molinahealth_mdwdb.f_incident_backlog_aggregator_weekly_c)
join  molinahealth_mdsdb.cmdb_ci_final c on cmdb_ci=c.sys_id and c.sourceinstance=i.sourceinstance
join molinahealth_mdwdb.d_lov_map map on COALESCE(CONCAT('STATE~INCIDENT~~~' ,UPPER(i.state)),'UNSPECIFIED') = map.src_rowid
left join molinahealth_mdsdb.sys_choice_final sf on priority=value and sf.name='incident' and sf.element='priority'
where map.dimension_wh_code = 'OPEN'group by 1,2,3,4 order by 1,2,3,4
)b
on a.name=b.name and a.user_input=b.user_input and a.dimension_name=b.label and b.week_end_date=a.aggregate_c_key
where b.src<>a.trgt;


