 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM (select * from molinahealth_mdsdb.u_hr_task_final where opened_at < closed_at) SRC 
  join molinahealth_mdwdb.f_hr_task_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN molinahealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~HR_TASK'

WHERE TIMESTAMPDIFF(second,SRC.opened_at,(SELECT CONVERT_TZ(MAX(lastupdated),'America/Los_Angeles','GMT') AS lastupdated

FROM molinahealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<>(f.age)
)a
