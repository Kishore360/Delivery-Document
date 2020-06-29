SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_case.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt
from ibmwatson_mdsdb.sn_customerservice_case_final SRC
LEFT JOIN ibmwatson_mdwdb.f_case TRGT
    ON (SRC.sys_id =TRGT.row_id
    AND SRC.sourceinstance =TRGT.source_id )
    join ibmwatson_mdwdb.d_case d on d.row_key=TRGT.case_key
    left join ibmwatson_mdwdb.d_lov_map map on map.src_key=TRGT.state_src_key
LEFT JOIN ibmwatson_mdwdb.d_calendar_date LKP
    ON(LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','UTC'),'%Y%m%d'),'UNSPECIFIED') and LKP.source_id=0)
WHERE case when dimension_wh_code<>'CLOSED' then 0 else LKP.row_key end<> TRGT.closed_on_key and SRC.cdctype<>'D')ma

