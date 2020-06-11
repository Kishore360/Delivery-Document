SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.ACTUAL_END_ON' ELSE 'SUCCESS' END as Message
from (select * from   #MDS_TABLE_SCHEMA.hp_rsc_positions_final where cdctype<>'D') SRC
left join (select *from   #MDS_TABLE_SCHEMA.hp_rsc_resource_assignments_final)SRC1
on SRC.position_id=SRC1.position_id
and SRC.sourceinstance=SRC1.sourceinstance
left join (select *from   #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final)SRC2
on SRC1.RESOURCE_ASSIGNMENT_ID=SRC2.ASSIGNMENT_ID
and SRC1.sourceinstance=SRC2.sourceinstance
left join  (select * from  #DWH_TABLE_SCHEMA.d_resource_plan) TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.ACTUAL_END_ON,'')<>null