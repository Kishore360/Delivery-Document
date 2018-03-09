SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.u_unauthorized_change_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.change_request_final SRC
JOIN fidelity_mdwdb.d_change_request trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE case when SRC.u_unauthorized_change = 1 then 'Y' else 'N' end <>trgt1.u_unauthorized_change_c



