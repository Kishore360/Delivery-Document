SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
-- select distinct a.Value_Chain,b.value_chain_c
 FROM paloalto_mdsdb.asmt_assessment_instance_question_final  a
 join paloalto_mdwdb.f_response b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where COALESCE(a.Value,
                'UNSPECIFIED')<>b.point_c;