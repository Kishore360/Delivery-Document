SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.incident_final SRC
-- left join fidelity_mdsdb.u_fmr_business_unit_final LKP on 
LEFT JOIN fidelity_mdwdb.d_problem_type_and_symptoms_c LKP on SRC.u_ci_symptom =LKP.row_id and SRC.sourceinstance=LKP.source_id
JOIN  fidelity_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(LKP.row_key,case when SRC.u_ci_symptom  is null then 0 else -1 end)<> TRGT.problem_type_and_symptoms_c_key; 





