SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project.program_key' ELSE 'SUCCESS' END as Message
from (select * from #MDS_TABLE_SCHEMA.hp_pm_projects_final) SRC

left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final SRC6
on SRC.PROJECT_ID = SRC6.PRJ_PROJECT_ID and SRC.sourceinstance = SRC6.sourceinstance
left join (select * from #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')SRC5
on SRC5.STAFFING_PROFILE_ID=SRC6.PRJ_STAFF_PROF_ID and SRC5.sourceinstance=SRC6.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_pm_work_plans_final where entity_type='WORK_PLAN')SRC2 
ON SRC.PROJECT_ID=SRC2.PROJECT_ID AND SRC.sourceinstance=SRC2.sourceinstance

inner join
(
select E.project_id,F.project_req_id,F.lifecycle_id,G.content_id,G.program_id,min(F.creation_date)
from (select * from   #MDS_TABLE_SCHEMA.hp_pm_projects_final) E
inner join(select * from   #MDS_TABLE_SCHEMA.hp_pfm_lifecycle_parent_entity_final where active_entity='PROJECT')F
on E.pfm_request_id=F.project_req_id
and E.SOURCEINSTANCE=F.SOURCEINSTANCE
left join(select * from   #MDS_TABLE_SCHEMA.hp_pgm_program_content_final)G
on F.lifecycle_id=G.content_id
and F.sourceinstance=G.sourceinstance
group by E.project_id,F.project_req_id,F.lifecycle_id,G.content_id)program
on program.project_id=SRC.project_id
left join  #DWH_TABLE_SCHEMA.f_project TRGT
on SRC.project_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_program) LKP
ON LKP.ROW_ID = program.program_id
and LKP.source_id=SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN program.program_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.program_key,'')
 
