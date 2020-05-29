SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.reopened_defect_age' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_key, TYP.dimension_wh_code, D.reopened_flag, 
coalesce(case when TYP.dimension_wh_code in ('BUG') and D.reopened_flag = 'Y' then LKP.reopened_wi_age else 0 end, 0) sr,
coalesce(TRGT.reopened_defect_age,'') tg*/
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.__numerify__primary_key, '')=D.row_id
and SRC.sourceinstance=D.source_id 

left join 
(
select LKP.work_item_key, LKP.source_id, 
sum(case when STS_TO.dimension_wh_code in ('IN PROGRESS', 'PROPOSED') or (STS_FRM.dimension_wh_code in ('PROPOSED') 
and STS_TO.dimension_wh_code in ('RESOLVED', 'COMPLETED', 'CANCELLED')) then LKP.primary_duration else 0 end) as reopened_wi_age

from #DWH_TABLE_SCHEMA.f_work_item_activity LKP

join (select distinct LKP.work_item_key, LKP.source_id
from #DWH_TABLE_SCHEMA.f_work_item_activity LKP
left join #DWH_TABLE_SCHEMA.d_lov_map STS_TO
on LKP.task_attribute_wh_new_value_key=STS_TO.src_key and LKP.source_id = STS_TO.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map STS_FRM
on LKP.task_attribute_wh_old_value_key=STS_FRM.src_key and LKP.source_id = STS_FRM.source_id

where LKP.task_attribute_wh_name = 'STATUS' and STS_FRM.dimension_wh_code in ('RESOLVED', 'COMPLETED', 'CANCELLED') and STS_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) REOPEN_WI
on REOPEN_WI.work_item_key = LKP.work_item_key and REOPEN_WI.source_id = LKP.source_id 
 
left join #DWH_TABLE_SCHEMA.d_lov_map STS_TO
on LKP.task_attribute_wh_new_value_key=STS_TO.src_key and LKP.source_id = STS_TO.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map STS_FRM
on LKP.task_attribute_wh_old_value_key=STS_FRM.src_key and LKP.source_id = STS_FRM.source_id

where LKP.task_attribute_wh_name = 'STATUS'
group by LKP.work_item_key, LKP.source_id
)LKP
on D.row_key=LKP.work_item_key and D.source_id=LKP.source_id
 
left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.workItemType))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
where coalesce(case when TYP.dimension_wh_code in ('BUG') and D.reopened_flag = 'Y' then LKP.reopened_wi_age else 0 end, 0) <> coalesce(TRGT.reopened_defect_age,'');