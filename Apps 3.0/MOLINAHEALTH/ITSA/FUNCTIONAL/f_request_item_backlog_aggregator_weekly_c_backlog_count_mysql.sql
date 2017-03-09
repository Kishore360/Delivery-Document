SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0  THEN 'MDS to DWH data validation failed for f_incident_backlog_aggregator_weekly_c' ELSE 'SUCCESS' END as Message from
(
select  
catalog_item,aggregate_c_key,sum(backlog_count) trgt
from   molinahealth_mdwdb.f_request_item_backlog_aggregator_weekly_c f
join molinahealth_mdwdb.d_calendar_date   cd on aggregate_c_key=cd.row_key
inner join(select DATE_FORMAT(
DATE_ADD(SUBDATE(max(lastupdated), WEEKDAY(max(lastupdated))),interval 5  day)
,'%Y%m%d') 
AS refreshday,max(lastupdated) from molinahealth_mdwdb.d_o_data_freshness as df     ) as df
on cd.row_id = df.refreshday group by 1,2 order by 1,2
) a 
JOIN 
(
SELECT SRC1.name AS name,d.row_id AS week_end_date, count(1) Source
FROM molinahealth_mdsdb.sc_req_item_final SRC
JOIN molinahealth_mdsdb.sc_cat_item_final  SRC1 
ON(SRC.cat_item=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance)
JOIN molinahealth_mdwdb.d_calendar_date d 
on d.row_id=(select distinct aggregate_c_key from molinahealth_mdwdb.f_request_item_backlog_aggregator_weekly_c)
join molinahealth_mdwdb.d_lov_map LOV
on COALESCE(CONCAT('STATE~sc_req_item~~~' ,UPPER(SRC.state)),'UNSPECIFIED') = LOV.src_rowid
AND LOV.dimension_wh_code = 'OPEN' group by 1,2 order by 1,2
) b 
on a.catalog_item=b.name and a.aggregate_c_key=b.week_end_date
where b.Source<>a.trgt


