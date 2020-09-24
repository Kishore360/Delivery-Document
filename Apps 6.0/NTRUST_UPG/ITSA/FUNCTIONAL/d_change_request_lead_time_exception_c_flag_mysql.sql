
SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.lead_time_exception_c_flag' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.change_request_final SRC
   join ntrust_mdwdb.d_change_request TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 left JOIN ntrust_mdwdb.d_lov TRGT2 ON
 COALESCE(CONCAT('PROCESS_EXCEPTION_SRC_C~CHANGE_REQUEST~',UPPER(SRC.u_process_exception)),'UNSPECIFIED')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where case when  TRGT2.dimension_name ='Lead Time Exception' THEN 'Y' 
            ELSE 'N' end
         <> TRGT.lead_time_exception_c_flag and SRC.cdctype='X' )temp;
