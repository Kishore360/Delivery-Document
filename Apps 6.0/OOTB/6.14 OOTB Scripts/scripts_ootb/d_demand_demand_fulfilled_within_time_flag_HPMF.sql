SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
from (select * from    #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.f_demand f_dem
on f_dem.demand_key=TRGT.row_key
left join(select * from  #DWH_TABLE_SCHEMA.d_project)d_proj
on f_dem.project_key=d_proj.row_key
left join(select * from #DWH_TABLE_SCHEMA.d_lov_map)lov_proj
on TRGT.demand_project_status_src_key=lov_proj.src_key
left join(select * from #DWH_TABLE_SCHEMA.d_lov_map)lov_dem
on TRGT.demand_status_src_key=lov_dem.src_key
LEFT join 
(select source_id,max(lastupdated) as refresh from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) fresh
on fresh.source_id=TRGT.source_id
WHERE 
case when lov_proj.dimension_wh_code= 'CLOSED'  and 
coalesce(d_proj.actual_end_on,d_proj.planned_end_on)  is not  null and 
coalesce(d_proj.actual_end_on,d_proj.planned_end_on)<= TRGT.demand_finish_date  then 'Y' 
 else 'N' end <> COALESCE(TRGT.fulfilled_within_time_flag,'')