 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_fulfillment_within_budget_flag' ELSE 'SUCCESS' END as Message
from (select * from     #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from    #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join   #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join  #DWH_TABLE_SCHEMA.d_demand d_dem
on TRGT.demand_key=d_dem.row_key
left join(select * from   #DWH_TABLE_SCHEMA.d_project)d_proj
on TRGT.project_key=d_proj.row_key
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)lov_proj
on d_dem.demand_project_status_src_key=lov_proj.src_key
left join(select * from  #DWH_TABLE_SCHEMA.d_lov_map)lov_dem
on d_dem.demand_status_src_key=lov_dem.src_key
LEFT join 
(select source_id,max(lastupdated) as refresh from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) fresh
on fresh.source_id=TRGT.source_id
WHERE case when lov_proj.dimension_wh_code ='CANCELLED' THEN 0 
when lov_proj.dimension_wh_code ='CLOSED' and datediff(d_dem.demand_fulfillment_date,d_dem.demand_finish_date)> 0 
then datediff(d_dem.demand_fulfillment_date,d_dem.demand_finish_date)
when lov_dem.dimension_wh_code IN ('CANCELLED','REJECTED') THEN 0 
WHEN datediff(fresh.refresh,d_dem.demand_finish_date) > 0 THEN datediff(fresh.refresh,d_dem.demand_finish_date) ELSE 0  end <> 
COALESCE(TRGT.demand_fulfillment_delay,0)