SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_numerify_application_dashboard_usage_c.numerify_application_dashboard_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from aetna_mdsdb.mstr_usage_aetna_final d 
left  join aetna_mdwdb.f_numerify_application_dashboard_usage_c e on 
concat(replace( STR_TO_DATE(replace(d.date, '/', '.'),GET_FORMAT(DATE,'USA')), '-', ''),'~',d.dashboard_id,'~',d.user_id) = e.row_id 
left join aetna_mdwdb.d_numerify_application_dashboard_c look on d.dashboard_id=look.row_id 
where look.row_key <> e.numerify_application_dashboard_c_key) temp;