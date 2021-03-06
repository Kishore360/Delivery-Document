SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_bu_cab_c' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_request TRGT
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
WHERE case when SRC.u_bu_cab = 1 then 'Y' else 'N' end <> (TRGT.u_bu_cab_c) 
