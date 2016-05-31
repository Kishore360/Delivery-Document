select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cost_center' ELSE 'SUCCESS' END as Message
from wow_workdb.ds_cost_center SRC
join wow_mdwdb.d_cost_center TRGT
on(SRC.row_id=TRGT.row_id and SRC.source_id=TRGT.source_id)
where (concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.cost_center_name,''),coalesce(SRC.cost_center_manager,''),coalesce(SRC.cost_center_id,''),coalesce(SRC.cost_center_account,''),coalesce(SRC.active_flag,''),coalesce(SRC.cost_center_code,''),coalesce(SRC.location_id,''),coalesce(SRC.created_on,''),coalesce(SRC.changed_on,'')))
<>(concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.cost_center_name,''),coalesce(SRC.cost_center_manager,''),coalesce(SRC.cost_center_id,''),coalesce(SRC.cost_center_account,''),coalesce(SRC.active_flag,''),coalesce(SRC.cost_center_code,''),coalesce(SRC.location_id,''),coalesce(SRC.created_on,''),coalesce(SRC.changed_on,'')));