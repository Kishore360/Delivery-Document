SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.program_key' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.hp_knta_users_final where cdctype<>'D') SRC
left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheets_final) SRC1
 on SRC.user_id=SRC1.resource_id
 and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheet_lines_final) SRC2
 on SRC1.time_sheet_id=SRC2.time_sheet_id
 and SRC.sourceinstance=SRC2.sourceinstance
 inner join(select SRC3.time_sheet_line_id,SRC4.effort_order,SRC3.sourceinstance,sum(actual_effort) as total_eff from
 (select * from  #MDS_TABLE_SCHEMA.hp_tm_actuals_final where TOTALS_FLAG='Y')SRC3
 left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_actuals_effort_final)SRC4
 on SRC3.actuals_id=SRC4.actuals_id group by SRC3.time_sheet_line_id, SRC3.sourceinstance,SRC4.effort_order
 and SRC3.sourceinstance=SRC4.sourceinstance)SRC6
 on SRC2.time_sheet_line_id=SRC6.time_sheet_line_id
 and SRC.sourceinstance=SRC6.sourceinstance
 left join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC7
 on SRC2.work_item_set_id=SRC7.prj_project_id
 inner join
(
select E.project_id,F.project_req_id,F.lifecycle_id,G.content_id,G.program_id,min(F.creation_date)
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final) E
inner join(select * from  #MDS_TABLE_SCHEMA.hp_pfm_lifecycle_parent_entity_final where active_entity='PROJECT')F
on E.pfm_request_id=F.project_req_id
and E.SOURCEINSTANCE=F.SOURCEINSTANCE
left join(select * from  #MDS_TABLE_SCHEMA.hp_pgm_program_content_final)G
on F.lifecycle_id=G.content_id
and F.sourceinstance=G.sourceinstance
group by E.project_id,F.project_req_id,F.lifecycle_id,G.content_id)program
on program.project_id=SRC7.prj_project_id
left join(select * from  #DWH_TABLE_SCHEMA.f_time_card)TRGT
on CONCAT(SRC6.time_sheet_line_id,'~',COALESCE(SRC6.effort_order,''))=COALESCE(TRGT.row_id,'') 
and COALESCE(SRC.sourceinstance,'')=COALESCE(TRGT.source_id,'')
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_program) LKP
ON LKP.ROW_ID = program.program_id
and LKP.source_id=SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN program.program_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.program_key,'')

