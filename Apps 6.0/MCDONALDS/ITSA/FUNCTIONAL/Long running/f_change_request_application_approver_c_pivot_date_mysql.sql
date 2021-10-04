
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
				   FROM
				   (select CONVERT_TZ(a11.sys_created_on,'GMT','US/Central') , pivot_date
 FROM mcd_mdsdb.change_request_final AS a11
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(a11.u_approver),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(a11.u_approver),'UNSPECIFIED'), ',', '')))
join mcd_mdwdb.f_change_request_application_approver_c d on 
CONCAT(a11.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(a11.u_approver), ',', n.n), ',', -1),'UNSPECIFIED')) = d.row_id
where MONTH(a11.sys_created_on)=MONTH(sysdate()) and  CONVERT_TZ(a11.sys_created_on,'GMT','US/Central') <> pivot_date)A ;


