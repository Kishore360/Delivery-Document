SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_vendor_reference_c_key' ELSE 'SUCCESS' END as Message
FROM bbandt_mdsdb.problem_final SRC 
LEFT JOIN bbandt_mdwdb.d_internal_organization LKP 
ON ((CONCAT( 'SUBSIDIARY~',SRC.u_vendor_reference))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
LEFT JOIN bbandt_mdwdb.f_problem TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_vendor_reference IS NULL THEN 0 else -1 end)<> 
(TRGT.vendor_reference_c_key); 

