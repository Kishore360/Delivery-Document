SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  
(select staff_prof_allocation_id,sourceinstance,RESOURCE_ID from  fidelity_mdsdb.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC -- 4747929
LEFT JOIN(select prj_staff_prof_id,sourceinstance,prj_project_id from fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1 -- 4747929
on SRC.staff_prof_allocation_id=SRC1.prj_staff_prof_id and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN fidelity_mdsdb.hp_knta_users_final SRC2 ON SRC.RESOURCE_ID=SRC2.USER_ID and SRC.sourceinstance=SRC2.sourceinstance 
/*LEFT JOIN (select row_id,source_id from  fidelity_mdwdb.f_resource_allocation)TRGT   
on CONCAT('ALLOCATED','~',coalesce(SRC1.prj_project_id,'UNSPECIFIED'),'~',coalesce(SRC.staff_prof_allocation_id,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id*/
JOIN fidelity_mdwdb.d_internal_contact TRGT1 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC2.USER_ID)=TRGT1.row_id  AND SRC2.sourceinstance = TRGT1.source_id )
LEFT JOIN fidelity_mdwdb.d_location LKP 
 on SRC2.LOCATION_CODE=LKP.row_id  AND SRC2.sourceinstance = LKP.source_id 
WHERE coalesce(LKP.row_key,case when SRC2.USER_ID is null then 0 else -1 end) <> COALESCE(TRGT1.location_key); 


