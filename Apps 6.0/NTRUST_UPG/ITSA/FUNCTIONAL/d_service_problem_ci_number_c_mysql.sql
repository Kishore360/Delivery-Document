SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.cmdb_ci_service_final SRC
LEFT JOIN ntrust_mdwdb.d_service TRGT2 ON (concat('BUSINESS_SERVICE~',b.sys_id)=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
COALESCE(b.u_number,'UNSPECIFIED')<> TRGT2.problem_ci_number_c and SRC.cdctype='X') temp;



