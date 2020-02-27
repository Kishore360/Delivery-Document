select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_approval_state' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,work_start FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,work_start_on  FROM fidelity_mdwdb.d_change_failure where  year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
where convert_tz(SRC.work_start,'GMT','America/New_York') <> coalesce(TRGT.work_start_on,'')