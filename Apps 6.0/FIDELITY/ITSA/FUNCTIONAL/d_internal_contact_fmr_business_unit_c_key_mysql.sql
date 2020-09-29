SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM   fidelity_mdsdb.sys_user_final SRC
left join  fidelity_mdwdb.d_fmr_business_unit_c LKP1 on SRC.department=LKP1.row_id
JOIN    fidelity_mdwdb.d_internal_contact TRGT 
ON (concat('INTERNAL_CONTACT~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE  coalesce(LKP1.row_key,case when department is null then 0 else -1 end  ) <>TRGT.fmr_business_unit_c_key and SRC.cdctype<>'D'; 


