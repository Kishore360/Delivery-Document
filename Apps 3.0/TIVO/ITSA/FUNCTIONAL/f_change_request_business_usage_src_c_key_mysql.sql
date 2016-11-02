SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select stg.business_usage_src_c_key ,LKP.row_key, u_business_usage
from  tivo_mdwdb.f_change_request stg
JOIN 
	(SELECT a.sys_id,
		    a.sourceinstance,
		    CASE 
				WHEN group_concat(c.u_business_usage) LIKE '%Production%' 
					OR group_concat(c.u_business_usage) LIKE '%VOD%'THEN 'PRODUCTION'
				WHEN group_concat(c.u_business_usage) LIKE '%Staging%' THEN 'STAGING' 
				WHEN group_concat(c.u_business_usage) LIKE '%Testing%' THEN 'TESTING'
		    END AS business_usage_c,u_business_usage
	FROM tivo_mdsdb.change_request_final a
	JOIN tivo_mdsdb.task_ci_final b ON a.sys_id = b.task
	JOIN tivo_mdsdb.cmdb_ci_final c ON b.ci_item = c.sys_id
	GROUP BY 1,2) src ON stg.row_id = src.sys_id 
	
	AND stg.source_id = src.sourceinstance
	join tivo_mdwdb.d_change_request LKP on CONCAT('BUSINESS_USAGE~CHANGE_REQUEST~~~',UPPER(src.business_usage_c))=LKP.row_id
	)a
	where a.business_usage_src_c_key <> coalesce(a.row_key,case when u_business_usage is null then 0 else -1 end )
	
	