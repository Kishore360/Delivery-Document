SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.incident_final id 
left join cardinalhealth_mdsdb.u_classification_final uc 
on uc.sys_id=id.u_classification and uc.sourceinstance=id.sourceinstance 
left join cardinalhealth_mdsdb.u_complexity_final  cd
on cd.sys_id=id.u_complexity and cd.sourceinstance=id.sourceinstance
join cardinalhealth_mdwdb.d_incident si
on id.sys_id=si.row_id and id.sourceinstance=si.source_id
where  si.complexity_c<>cd.u_value;
