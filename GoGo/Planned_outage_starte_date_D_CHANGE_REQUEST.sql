SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(*) as cnt from gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.d_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance=i.source_id
where  coalesce(s.u_planned_outage_start_date,' ')<>coalesce(CONVERT_TZ(i.planned_outage_start_date_on,'GMT','America/New_York'),' ')
) c;
 
