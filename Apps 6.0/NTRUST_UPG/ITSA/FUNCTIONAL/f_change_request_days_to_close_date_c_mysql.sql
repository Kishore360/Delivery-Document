







SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN   ntrust_mdwdb.f_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
 TIMESTAMPDIFF(SECOND,COALESCE(CONVERT_TZ( SRC.work_start, 'UTC','US/Central'),
CONVERT_TZ( SRC.sys_created_on,'UTC','US/Central')),CONVERT_TZ( SRC.closed_at,
'UTC','US/Central')) 
<> TRGT2.days_to_close_date_c and SRC.cdctype='X') temp;

