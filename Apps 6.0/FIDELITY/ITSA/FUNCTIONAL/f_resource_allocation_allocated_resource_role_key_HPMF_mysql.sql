SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from  fidelity_mdsdb.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC 
LEFT JOIN(select * from fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staff_prof_allocation_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN(select * from fidelity_mdsdb.hp_rsc_resources_final)SRC2
on SRC.resource_id=SRC2.resource_id
LEFT JOIN (select * from  fidelity_mdwdb.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from fidelity_mdwdb.d_resource_role)LKP
on LKP.row_id  = COALESCE(SRC2.primary_role_id,'') and LKP.source_id  = SRC.sourceinstance
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.primary_role_id is null THEN 0 else '-1' end)<> COALESCE(TRGT.resource_role_key,'');     
