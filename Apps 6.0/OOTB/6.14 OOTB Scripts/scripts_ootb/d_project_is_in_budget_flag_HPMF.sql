SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.IS_IN_BUDGET_FLAG' ELSE 'SUCCESS' END as Message
from (select * from    #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC
left join (select * from  #DWH_TABLE_SCHEMA.d_project )TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from  #DWH_TABLE_SCHEMA.f_project)LKP
on TRGT.project_id=LKP.row_id
LEFT JOIN     #DWH_TABLE_SCHEMA.d_lov_map LOV
ON LOV.src_key=LKP.project_state_src_key
AND LOV.source_id=SRC.sourceinstance and LOV.dimension_class = 'PROJECT~STATE'
where COALESCE(CASE WHEN LOV.dimension_wh_code IN ('CANCELLED') THEN 'N'
               WHEN LKP.estimated_doc_cost=0 AND LKP.total_actual_doc_cost=0 THEN 'Y' 
               WHEN LKP.estimated_doc_cost=0  AND LKP.total_actual_doc_cost>0 THEN 'N' 
            WHEN LKP.planned_percent_complete = 0 AND LKP.total_actual_doc_cost>0 THEN 'N' 
            WHEN LKP.planned_percent_complete = 0 AND LKP.total_actual_doc_cost=0 THEN 'Y' 
            WHEN (LKP.total_actual_doc_cost - (LKP.estimated_doc_cost*LKP.actual_percent_complete)) > 0 THEN 'N' 
            ELSE 'Y' END,'') <> COALESCE(TRGT.is_in_budget_flag,'')