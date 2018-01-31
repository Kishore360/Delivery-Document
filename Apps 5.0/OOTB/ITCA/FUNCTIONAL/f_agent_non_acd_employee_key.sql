SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd.employee_key' ELSE 'SUCCESS' END as Message
FROM
(select TRGT.row_id from qa_int_hf5_mdsdb.new_call_final SRC
LEFT JOIN qa_int_hf5_mdwdb.f_agent_non_acd TRGT
            ON (SRC.sys_id=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN qa_int_hf5_mdwdb.d_internal_contact LKP
            ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',trim(SRC.opened_by)),'UNSPECIFIED') = LKP.row_id
            AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN trim(SRC.opened_by) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'')
union
select TRGT.row_id from qa_int_hf5_mdsdb.incident_final SRC
LEFT JOIN qa_int_hf5_mdwdb.f_agent_non_acd TRGT
            ON (SRC.sys_id=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN qa_int_hf5_mdwdb.d_internal_contact LKP
            ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',trim(SRC.opened_by)),'UNSPECIFIED') = LKP.row_id
            AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN trim(SRC.opened_by) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'')) SQ