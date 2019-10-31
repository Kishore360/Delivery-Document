SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_Problem.staffed_by_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM keybank_mdsdb.problem_final SRC 
LEFT JOIN keybank_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join keybank_mdsdb.sys_user_group_final LKP1 on LKP1.sys_id=SRC.assignment_group and SRC.sourceinstance=LKP1.sourceinstance
left join keybank_mdsdb.core_company_final LKP2 on LKP2.sys_id=LKP1.u_staffed_by and LKP1.sourceinstance=LKP2.sourceinstance

WHERE coalesce(LKP2.name,'UNSPECIFIED')<>TRGT.staffed_by_c
AND SRC.cdctype='X'and TRGT.soft_deleted_flag='N') temp; 
