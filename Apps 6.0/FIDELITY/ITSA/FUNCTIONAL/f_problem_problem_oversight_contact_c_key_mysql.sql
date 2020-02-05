SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.problem_final SRC
JOIN  fidelity_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_internal_contact LKP
on CONCAT('INTERNAL_CONTACT~',SRC.u_problem_oversight_contact)=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_problem_oversight_contact is null then 0 else -1 end) <>TRGT.problem_oversight_contact_c_key and SRC.cdctype<>'D'; 













