SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.u_pg_non_compliant_c' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.change_request_final a
 join png_mdwdb.d_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE case when a.u_pg_non_compliant=1 then 'Y' else 'N' end<> b.u_pg_non_compliant_c;


