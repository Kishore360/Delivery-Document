SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_total_fcr_calls' ELSE 'SUCCESS' END as Message
 from avaya_only_mdsdb.us_a_agent_fcr_final SRC
LEFT JOIN avaya_only_mdwdb.f_agent_non_acd TRGT
            ON (CONCAT(SRC.acd_no,'~',SRC.employee_id,'~',DATE_FORMAT(SRC.opened_on,'%Y%m%d'))=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
WHERE coalesce(SRC.total_fcr_calls,'') <> coalesce(TRGT.total_fcr_calls,'')
