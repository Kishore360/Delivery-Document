SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.user_type' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_positions_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(TRGT.user_type ,'')<>0