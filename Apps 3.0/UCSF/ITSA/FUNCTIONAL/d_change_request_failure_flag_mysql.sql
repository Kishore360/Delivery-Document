SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
from ucsf_mdwdb.d_change_request cr 
JOIN  ucsf_mdsdb.change_request_final crf ON crf.sys_id=cr.row_id 
  AND crf.sourceinstance=cr.source_id
where 
	
	CASE WHEN crf.u_change_result='Successful' THEN 'N' ELSE 'Y'  END<>cr.failure_flag