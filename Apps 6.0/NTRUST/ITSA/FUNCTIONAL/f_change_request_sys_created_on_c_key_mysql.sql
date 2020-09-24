
		



SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.change_request_final SRC
   join ntrust_mdwdb.f_change_request TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 left JOIN ntrust_mdwdb.d_calendar_date TRGT2 ON
  on  DATE_FORMAT(convert_tz(coalesce(SRC.sys_created_on),'GMT','America/New_York'),'%Y%m%d')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where (TRGT2.row_key)
         <> TRGT.sys_created_on_c_key and SRC.cdctype='X' )temp;
