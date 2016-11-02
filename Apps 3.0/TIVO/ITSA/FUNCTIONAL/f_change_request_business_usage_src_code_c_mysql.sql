
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select stg.business_usage_src_code_c , src.business_usage_c
from   tivo_mdwdb.f_change_request stg
JOIN 
	(SELECT a.sys_id,
		    a.sourceinstance,
		    CASE 
				WHEN group_concat(c.u_business_usage) LIKE '%Production%' 
					OR group_concat(c.u_business_usage) LIKE '%VOD%'THEN 'PRODUCTION'
				WHEN group_concat(c.u_business_usage) LIKE '%Staging%' THEN 'STAGING' 
				WHEN group_concat(c.u_business_usage) LIKE '%Testing%' THEN 'TESTING'
		    END AS business_usage_c
	FROM tivo_mdsdb.change_request_final a
	JOIN tivo_mdsdb.task_ci_final b ON a.sys_id = b.task
	JOIN tivo_mdsdb.cmdb_ci_final c ON b.ci_item = c.sys_id
	GROUP BY 1,2) src ON stg.row_id = src.sys_id 
	AND stg.source_id = src.sourceinstance)a
where  business_usage_src_code_c <> business_usage_c


