SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd.employee_key' ELSE 'SUCCESS' END as Message
from cardinalhealth_mdsdb.us_a_agent_fcr_final SRC
LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT
            ON (CONCAT(SRC.acd_no,'~',SRC.employee_id,'~',DATE_FORMAT(SRC.opened_on,'%Y%m%d'))=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP
            ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',acd_no,'~',employee_id)) = LKP.row_id
            AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN trim(SRC.employee_id) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'');