SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0  THEN 'MDS to DWH data validation failed for f_incident_backlog_aggregator_weekly_c' ELSE 'SUCCESS' END as Message 
FROM 
(select  
coalesce(d.name,case when d.row_id is null and configuration_item_key=0 then 'UNSPECIFIED' else 'UNKNOWN' end )as name  ,catalog_item user_input,dimension_name,aggregate_c_key,
sum(backlog_count) trgt
from   molinahealth_mdwdb.f_incident_backlog_aggregator_weekly_c f
 left join  molinahealth_mdwdb.d_configuration_item d on d.row_key=configuration_item_key and d.source_id=f.source_id
 join molinahealth_mdwdb.d_calendar_date   cd on aggregate_c_key=cd.row_key
join(select DATE_FORMAT(
DATE_ADD(SUBDATE(max(lastupdated), WEEKDAY(max(lastupdated))),interval 5  day)
,'%Y%m%d') 
AS refreshday,max(lastupdated) from molinahealth_mdwdb.d_o_data_freshness as df  ) as df
on cd.row_id = df.refreshday
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
 ON LKP.row_key=f.priority_src_key -- where d.soft_deleted_flag='N'  
 group by 1,2,3,4 order by 1,2,3,4)a
  join
(
select 
coalesce(c.name,case when cmdb_ci is null then 'UNSPECIFIED' else 'UNKNOWN' end )as name  ,coalesce(user_input,'UNSPECIFIED') user_input,sf.label,d.row_id week_end_date,count(1) src 
from  molinahealth_mdsdb.incident_final i
join  molinahealth_mdwdb.d_calendar_date d on d.row_id  in (select distinct   aggregate_c_key from molinahealth_mdwdb.f_incident_backlog_aggregator_weekly_c)
left join   molinahealth_mdwdb.d_configuration_item c on coalesce(cmdb_ci,'UNSPECIFIED')=c.row_id and c.source_id=i.sourceinstance
 left join molinahealth_mdwdb.d_lov_map map on COALESCE(CONCAT('STATE~INCIDENT~~~' ,UPPER(i.state)),'UNSPECIFIED') = map.src_rowid
 left join molinahealth_mdsdb.sys_choice_final sf on priority=value and sf.name='incident' and sf.element='priority'
where -- c.soft_deleted_flag='N' and
 map.dimension_wh_code = 'OPEN'group by 1,2,3,4 order by 1,2,3,4
)b
on b.name=a.name and coalesce(a.user_input,'UNSPECIFIED')=coalesce(b.user_input,'UNSPECIFIED') 
and coalesce(a.dimension_name,'UNSPECIFIED')=coalesce(b.label,'UNSPECIFIED') and b.week_end_date=a.aggregate_c_key
where b.src<>a.trgt ;


