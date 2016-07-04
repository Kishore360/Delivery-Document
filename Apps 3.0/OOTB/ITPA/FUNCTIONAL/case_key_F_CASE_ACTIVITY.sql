select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity.case_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_case D
on D.row_id =  SRC.documentkey  AND D.source_id =  SRC.sourceinstance 
where TGT.task_wh_type = 'sn_customerservice_case'
and COALESCE(case when D.row_key is null and SRC.documentkey is null then 0
when D.row_key is null and SRC.documentkey is not null then -1
else D.row_key end,'') <> COALESCE(TGT.case_key,'')
) SQ;
