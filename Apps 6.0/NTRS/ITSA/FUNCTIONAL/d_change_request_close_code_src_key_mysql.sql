SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrustbrn_mdwdb.d_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrustbrn_mdwdb.d_lov LKP ON CONCAT('CLOSE_CODE~CHANGE_REQUEST','~',UPPER(SRC.close_code))=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when close_code is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.close_code_src_key and SRC.cdctype='X') temp;