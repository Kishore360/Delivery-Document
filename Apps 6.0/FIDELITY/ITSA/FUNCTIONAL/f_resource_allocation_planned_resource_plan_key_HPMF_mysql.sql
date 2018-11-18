SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from  fidelity_mdsdb.hp_rsc_position_forecast_final where cdctype<>'D') SRC 
LEFT JOIN(select * from fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staffing_profile_id=SRC1.prj_staff_prof_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN(select * from fidelity_mdsdb.hp_rsc_positions_final)SRC2
on SRC.position_id=SRC2.position_id
and SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN (select * from  fidelity_mdwdb.f_resource_allocation)TRGT   
on CONCAT('PLANNED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.position_forecast_id,'UNSPECIFIED'),'~',
coalesce(SRC.position_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from fidelity_mdwdb.d_resource_plan)LKP
on (LKP.row_id  = CONCAT('POSITION~',SRC2.position_id) and LKP.source_id  = SRC.sourceinstance)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.position_id is null THEN 0 else '-1' end)<> COALESCE(TRGT.resource_plan_key,'');  

    
