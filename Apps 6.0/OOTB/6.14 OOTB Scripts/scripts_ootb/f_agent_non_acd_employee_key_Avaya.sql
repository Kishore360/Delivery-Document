SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd.employee_key' ELSE 'SUCCESS' END as Message
FROM
(select TRGT.row_id from #MDS_TABLE_SCHEMA.new_call_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_non_acd TRGT
            ON (SRC.sys_id=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP
            ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',trim(SRC.opened_by)),'UNSPECIFIED') = LKP.row_id
            AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN trim(SRC.opened_by) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'')
union
select TRGT.row_id from #MDS_TABLE_SCHEMA.incident_final SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_non_acd TRGT
            ON (SRC.sys_id=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP
            ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',trim(SRC.opened_by)),'UNSPECIFIED') = LKP.row_id
            AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN trim(SRC.opened_by) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'')) SQ