SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocation_number' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
inner JOIN(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staffing_profile_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN(select * from #MDS_TABLE_SCHEMA.hp_rsc_resource_assignments_final)SRC2
on SRC.assignment_id=SRC2.resource_assignment_id
and SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC2.resource_assignment_id)<> COALESCE(TRGT.allocation_number,'')




    
