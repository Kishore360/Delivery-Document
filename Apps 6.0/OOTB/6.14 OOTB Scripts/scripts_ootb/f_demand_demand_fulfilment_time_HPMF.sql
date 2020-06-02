SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
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
WHERE 
(case when lov_proj.dimension_wh_code='CANCELLED' then 0 else
COALESCE(datediff(d_dem.demand_fulfillment_date,d_dem.created_on),'')end) <>
 COALESCE(TRGT.demand_fulfilment_time,0)