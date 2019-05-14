SELECT CASE WHEN cnt>0 THEN 'FAILURE' 

ELSE 'SUCCESS' END as Result,
 CASE WHEN 

cnt >0 THEN 'Failure' ELSE 'Data 

Matched' END as Message
 FROM

 (select count(1) cnt from 
cardinalhealth_mdsdb.incident_final a
 join cardinalhealth_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where  b.soft_deleted_flag='N' and b.u_major_incident_state_src_code_c<>a.u_major_incident_state)a;
