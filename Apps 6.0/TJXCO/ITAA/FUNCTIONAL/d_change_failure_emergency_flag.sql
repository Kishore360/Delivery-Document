
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.emergency_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join apps_nb_mdwdb.d_lov_map LM
on (LM.dimension_code=TRGT.change_type
AND LM.dimension_class='TYPE~CHANGE_REQUEST') 
 WHERE coalesce(CASE WHEN (LM.dimension_wh_code = 'Emergency')
 THEN 'Y' ELSE 'N' END,'') <> coalesce(TRGT.emergency_flag,'') 
