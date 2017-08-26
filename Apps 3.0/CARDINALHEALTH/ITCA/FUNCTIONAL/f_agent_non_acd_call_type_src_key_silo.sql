SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_day_key' ELSE 'SUCCESS' END as Message
from cardinalhealth_mdsdb.us_a_agent_fcr_final SRC
  LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT
 ON (CONCAT(SRC.acd_no,'~',SRC.employee_id,'~',DATE_FORMAT(SRC.opened_on,'%Y%m%d'))=TRGT.row_id
            AND SRC.sourceinstance =TRGT.source_id )
 WHERE 0 <> coalesce(TRGT.call_type_src_key,'');


