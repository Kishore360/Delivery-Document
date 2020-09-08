

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrust_mdwdb.d_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrust_mdwdb.d_lov LKP ON CONCAT('PROCESS_EXCEPTION_SRC_C~CHANGE_REQUEST~',UPPER(SRC.u_process_exception))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where coalesce(SRC.u_process_exception,'UNSPECIFIED')<> TRGT2.u_process_exception_c and SRC.cdctype='X') temp;

