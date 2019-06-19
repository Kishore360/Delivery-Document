SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for f_change_request.impact_value_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.change_request_final a
 join png_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE a.u_pg_impact_value<> b.impact_value_c;



