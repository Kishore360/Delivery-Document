SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
 FROM
cardinalhealth_mdsdb.incident_final SRC
left join cardinalhealth_mdwdb.f_incident TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.u_verb,'UNSPECIFIED')<>TRGT.u_verb_src_code_c