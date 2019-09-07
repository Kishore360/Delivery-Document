SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.open_to_close_duration' ELSE 'SUCCESS' END as Message
from(select 
TIMESTAMPDIFF(SECOND, SRC.opened_at,SRC.closed_at)
, TRGT.open_to_close_duration
FROM watson_mdsdb.sn_customerservice_case_final SRC
 LEFT JOIN watson_mdwdb.f_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) and  TRGT.soft_deleted_flag='N'
 LEFT JOIN watson_mdwdb.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id and SRC.cdctype='X' AND L.dimension_class = 'STATE~CASE' )
WHERE TIMESTAMPDIFF(SECOND, SRC.opened_at,SRC.closed_at)
<>COALESCE(TRGT.open_to_close_duration ))ma;