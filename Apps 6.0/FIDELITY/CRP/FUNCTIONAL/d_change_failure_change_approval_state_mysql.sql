select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_approval_state' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,approval FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,change_approval_state FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left outer join fidelity_mdwdb.d_lov lov 
on concat('APPROVAL~CHANGE_REQUEST~',approval)=lov.row_id
AND SRC.sourceinstance = lov.source_id 
where coalesce(lov.dimension_name,'UNSPECIFIED') <> coalesce(TRGT.change_approval_state,'')