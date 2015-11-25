SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' 

ELSE 'SUCCESS' END as Result,
 CASE WHEN 

count(1) >0 THEN 'Failure' ELSE 'Data 

Matched' END as Message
 FROM

 
cardinalhealth_mdsdb.incident_final a
left join cardinalhealth_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.u_verb_src_code_c<>a.u_verb;
