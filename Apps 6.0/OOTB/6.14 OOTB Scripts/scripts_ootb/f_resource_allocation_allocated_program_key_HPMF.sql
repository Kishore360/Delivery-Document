SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.program_key' ELSE 'SUCCESS' END as Message
FROM  (select * from   #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
inner join(select * from   #MDS_TABLE_SCHEMA.hp_rsc_staffing_profiles_final where is_active_flag='Y')staf_prof
on SRC.staffing_profile_id=staf_prof.staffing_profile_id
and SRC.sourceinstance=staf_prof.sourceinstance
LEFT JOIN(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staffing_profile_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN(select * from  #MDS_TABLE_SCHEMA.hp_rsc_resource_assignments_final)SRC2
on SRC.assignment_id=SRC2.resource_assignment_id
and SRC.sourceinstance=SRC2.sourceinstance
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
on program.project_id=SRC1.prj_project_id
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_program) LKP
ON LKP.ROW_ID = program.program_id
and LKP.source_id=SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN program.program_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.program_key,'')