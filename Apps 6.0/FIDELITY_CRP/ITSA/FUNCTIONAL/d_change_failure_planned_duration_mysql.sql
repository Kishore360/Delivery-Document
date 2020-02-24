-- Note: Disabled the Cancelled condition as suggested by PM. (ITSM-3530)

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.planned_duration' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,state,start_date, end_date FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,planned_duration FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  
left join fidelity_mdwdb.d_lov_map LKP 
on  SRC.state=LKP.dimension_code  
and SRC.sourceinstance=LKP.source_id
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
WHERE 
 case -- when LKP.dimension_wh_code in ('CANCELED') then 0 
when (SRC.start_date>SRC.end_date or TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) >'214748364' or SRC.start_date is null or SRC.end_date is null)
 then -1 else
 COALESCE(TIMESTAMPDIFF(SECOND, SRC.start_date, SRC.end_date) ,0)end <> COALESCE(TRGT.planned_duration ,'')
