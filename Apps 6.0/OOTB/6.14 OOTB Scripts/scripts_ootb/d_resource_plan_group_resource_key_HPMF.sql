SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.group_resource_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_rsc_positions_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_organization LKP
on concat('GROUP~',SRC.RESOURCE_POOL_ID)=LKP.row_id
and SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.RESOURCE_POOL_ID is null THEN 0 else '-1' end)<> COALESCE(TRGT.GROUP_RESOURCE_KEY,0)
