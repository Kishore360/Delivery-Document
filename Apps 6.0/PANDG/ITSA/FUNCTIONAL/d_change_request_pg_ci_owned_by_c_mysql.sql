SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from png_mdsdb.change_request_final where CDCTYPE<>'D') a 
join 
png_mdwdb.d_internal_contact b
on coalesce(CONCAT('INTERNAL_CONTACT~',a.u_pg_ci_owned_by),'UNSPECIFIED') =b.row_id
JOIN png_mdwdb.d_change_request c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
WHERE coalesce(b.row_key,case when a.u_pg_ci_owned_by is null then 0 else -1 end )<>c.pg_ci_owned_by_c
) temp;