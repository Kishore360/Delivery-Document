gogo_mdsdb.change_request_final s
inner join gogo_mdwdb.f_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id 
and s.sourceinstance=i.source_id
where coalesce(DATE_FORMAT(CONVERT_TZ(s.u_planned_outage_start_date,'GMT','America/New_York'),'%Y%m%d'),' ')
<>coalesce(i.planned_outage_start_date_c_key,' ')
