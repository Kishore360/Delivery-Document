SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from  fidelity_mdsdb.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
LEFT JOIN(select * from fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staff_prof_allocation_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from  fidelity_mdwdb.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
WHERE coalesce(TRGT.per_hour_loc_cost,'') <> null




    
