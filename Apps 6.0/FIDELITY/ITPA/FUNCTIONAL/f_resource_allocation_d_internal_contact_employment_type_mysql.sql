SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_employment_type' ELSE 'SUCCESS' END as Message
FROM  
(select staff_prof_allocation_id,sourceinstance,RESOURCE_ID from  fidelity_mdsdb.hp_rsc_staff_prof_allocation_final where cdctype<>'D') SRC
LEFT JOIN(select prj_staff_prof_id,sourceinstance,prj_project_id from fidelity_mdsdb.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.staff_prof_allocation_id=SRC1.prj_staff_prof_id and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN fidelity_mdsdb.hp_knta_users_final SRC2 ON SRC.RESOURCE_ID=SRC2.USER_ID and SRC.sourceinstance=SRC2.sourceinstance 
JOIN fidelity_mdwdb.d_internal_contact TRGT1
 ON ( CONCAT('INTERNAL_CONTACT~',SRC2.USER_ID)=TRGT1.row_id  AND SRC2.sourceinstance = TRGT1.source_id )
WHERE SRC2.RESOURCE_CATEGORY_CODE <> TRGT1.employment_type; 
