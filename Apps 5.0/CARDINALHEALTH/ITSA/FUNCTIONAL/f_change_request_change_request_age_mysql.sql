 select 
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_CHANGE_REQUEST.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM 
(select sys_id,sourceinstance,opened_at from cardinalhealth_mdsdb.change_request_final SRC where opened_at <closed_at) SRC 
  join cardinalhealth_mdwdb.f_change_request f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~CHANGE_REQUEST'
WHERE TIMESTAMPDIFF(Second,SRC.opened_at,(SELECT CONVERT_TZ(max(lastupdated),'America/New_York','GMT')
 AS lastupdated FROM cardinalhealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=f.etl_run_number))<>f.change_request_age
)A
 
 
 