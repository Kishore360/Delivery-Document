
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers6_mdwdb.d_problem d 
JOIN rogers6_mdsdb.problem_final p ON d.row_id=p.sys_id
where CONCAT('<a href=\"',
            'https://rogers2.service-now.com/',
            '\/problem.do?sys_id=',
            sys_id,
            '\" target=\"_blank\">',
            'View RCA',
            '</a>') <> rca_report_link_c 
and p.cdctype='X'  )a

			
				






			