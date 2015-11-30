SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column engagement_on_c'
           ELSE 'Data Matched for column engagement_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt  from intuit_mdsdb.incident_final s
	inner join intuit_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
	where CONVERT_TZ(coalesce(u_engagement_timestamp,' '),'GMT','America/New_York') <> coalesce(i.engagement_on_c,' ')) A;
