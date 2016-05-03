SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column assigned_to_key'
           ELSE 'Data Matched for column assigned_to_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final a
   INNER JOIN intuit_workdb.dwh_f_incident_task_c b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id 
   #and b.row_key < 1000
   LEFT OUTER JOIN intuit_workdb.dwh_d_internal_contact c ON coalesce(a.assigned_to COLLATE utf8_unicode_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.assigned_to IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.assigned_to_key)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column assignment_group'
           ELSE 'Data Matched for column assignment_group'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final a
   INNER JOIN intuit_workdb.dwh_f_incident_task_c b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id 
   #and b.row_key < 1000
   LEFT OUTER JOIN intuit_workdb.dwh_d_internal_organization c ON coalesce(a.assignment_group COLLATE utf8_unicode_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.assignment_group IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.assignment_group_key) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_business_service.'
           ELSE 'Data Matched for column u_business_service'
       END AS Message FROM
  (SELECT count(*) AS cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE coalesce(s.u_business_service COLLATE utf8_unicode_ci,' ') <> coalesce(i.business_service_code_c,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column business_service_key_c.'
           ELSE 'Data Matched for column business_service_key_c'
       END AS Message FROM
  (SELECT count(*) AS cnt
   FROM intuit_mdsdb.incident_final a
   INNER JOIN intuit_workdb.dwh_f_incident b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id -- and b.row_key < 500
   LEFT OUTER JOIN intuit_workdb.dwh_d_configuration_item c ON coalesce(a.u_business_service COLLATE utf8_unicode_ci) = c.row_id
   WHERE CASE WHEN a.u_business_service IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.business_service_key_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column cause_code.'
           ELSE 'Data Matched for column cause_code'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_symptom COLLATE utf8_unicode_ci,' ') <> coalesce(i.cause_code,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column close_code_src_code'
           ELSE 'Data Matched for column close_code_src_code'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_close_code COLLATE utf8_unicode_ci,' ') <> coalesce(i.close_code_src_code,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column close_code_src_code_key'
           ELSE 'Data Matched for column close_code_src_code_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_workdb.dwh_f_incident_task_c f
   LEFT OUTER JOIN intuit_workdb.dwh_d_lov l ON f.close_code_src_code = l.dimension_code
   AND l.dimension_class ='CLOSE_CODE~INCIDENT'
   WHERE CASE WHEN f.close_code_src_code IS NULL THEN '0' ELSE CASE WHEN l.dimension_code IS NULL THEN '-1' ELSE l.row_key END END <> f.close_code_src_code_key) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column detect_duration_c.'
           ELSE 'Data Matched for column detect_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_time_to_detect),'0') <> coalesce(i.detect_duration_c,'0')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column detect_on_c.'
           ELSE 'Data Matched for column detect_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_detect_date,' ') <> coalesce(i.detect_on_c,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column detect_on_c'
           ELSE 'Data Matched for column detect_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE CONVERT_TZ(coalesce(u_detect_date,' '),'GMT','America/New_York') <> coalesce(i.detect_on_c,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column detect_on_key_c'
           ELSE 'Data Matched for column detect_on_key_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE DATE_FORMAT(CONVERT_TZ(coalesce(u_detect_date,'0'),'GMT','America/New_York'),'%Y%m%d') <> i.detect_on_key_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match '
           ELSE 'Data Matched'
       END AS Message
FROM
  (SELECT count(*) AS cnt
   FROM intuit_workdb.dwh_f_incident_task_c i1
   INNER JOIN intuit_workdb.dwh_d_internal_contact i2 ON i1.assigned_to_key = i2.row_key
   INNER JOIN dwh_d_lov l ON dimension_class LIKE 'STATE~U_INCIDENT_TASK'
   AND l.row_key=i1.state_src_key
   INNER JOIN dwh_d_lov_map l1 ON l.row_key=l1.src_key
   AND l1.dimension_wh_code NOT IN ('RESOLVED','CLOSED')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column engagement_duration_c.'
           ELSE 'Data Matched for column engagement_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',coalesce(s.u_time_to_engage,'0')) <> i.engagement_duration_c) A;

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
	
SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column engagement_on_c.'
           ELSE 'Data Matched for column engagement_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE u_engagement_timestamp <> i.engagement_on_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column engagement_on_key_c.'
           ELSE 'Data Matched for column engagement_on_key_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.u_engagement_timestamp,'GMT','America/New_York'),'%Y%m%d'),'0') <> i.engagement_on_key_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column first_call_resolution_flag'
           ELSE 'Data Matched for column first_call_resolution_flag'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM
     (SELECT i.first_call_resolution_flag,
             CASE WHEN s.u_fcr = '1' THEN 'Y' WHEN s.u_fcr ='0' THEN 'N' ELSE NULL END AS fcrflag
      FROM intuit_mdsdb.incident_final s
      INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
      AND s.sourceinstance = i.source_id)A
   WHERE coalesce(first_call_resolution_flag,' ') <> coalesce(fcrflag,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column implementation_duration_c.'
           ELSE 'Data Matched for column implementation_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',coalesce(s.u_time_to_implement,'0')) <> i.implementation_duration_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column incident_key'
           ELSE 'Data Matched for column incident_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final a
   INNER JOIN intuit_workdb.dwh_f_incident_task_c b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id
   AND a.sourceinstance=b.source_id 
   #and b.row_key < 5000
   LEFT OUTER JOIN intuit_workdb.dwh_d_incident c ON coalesce(a.u_ud_parent COLLATE utf8_unicode_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.u_ud_parent IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.incident_key) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column ioc_duration_c'
           ELSE 'Data Matched for column ioc_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_time_to_ioc) <> i.ioc_duration_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column last_resolved_on_key'
           ELSE 'Data Matched for column last_resolved_on_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.u_actual_resolve_date,'GMT','America/New_York'),'%Y%m%d'),'0') <> coalesce(i.last_resolved_on_key,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column major_incident_flag'
           ELSE 'Data Matched for column major_incident_flag'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM
     (SELECT i.major_incident_flag,
             CASE WHEN s.u_major_incident = '1' THEN 'Y' WHEN s.u_major_incident ='0' THEN 'N' ELSE NULL END AS majorincidentflag
      FROM intuit_mdsdb.incident_final s
      INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
      AND s.sourceinstance = i.source_id) A
   WHERE coalesce(major_incident_flag,' ') <> coalesce(majorincidentflag,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column opened_by_key.'
           ELSE 'Data Matched for column opened_by_key'
       END AS Message 
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final a
   INNER JOIN intuit_workdb.dwh_f_incident b ON a.sys_id COLLATE utf8_general_ci = b.row_id
   AND a.sourceinstance=b.source_id
   AND b.row_key < 1000
   LEFT OUTER JOIN intuit_workdb.dwh_d_internal_contact c ON coalesce(a.u_client COLLATE utf8_general_ci,' ') = coalesce(c.row_id,' ')
   WHERE CASE WHEN a.u_client IS NULL THEN '0' ELSE CASE WHEN c.row_key IS NULL THEN '-1' ELSE c.row_key END END <> b.opened_by_key)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column opened_on_key'
           ELSE 'Data Matched for column opened_on_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','America/New_York'),'%Y%m%d'),'0') <> coalesce(i.opened_on_key,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column Open_to_resolve_duration'
           ELSE 'Data Matched for column Open_to_resolve_duration'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_resolution_duration),' ') <> coalesce(i.Open_to_resolve_duration,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column Open_to_response_duration'
           ELSE 'Data Matched for column Open_to_response_duration'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.u_incident_task_final s
   INNER JOIN intuit_workdb.dwh_f_incident_task_c i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_response_duration),' ') <> coalesce(i.Open_to_response_duration,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column pending_code_src_code'
           ELSE 'Data Matched for column pending_code_src_code'
       END AS Message
FROM
  (SELECT count(*) cnt from intuit_mdsdb.u_incident_task_final s
	inner join intuit_workdb.dwh_f_incident_task_c i on s.sys_id collate utf8_unicode_ci=i.row_id 
	where coalesce(s.u_pending_code collate utf8_unicode_ci,' ') <> coalesce(i.pending_code_src_code ,' ')) A;
	
SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column pending_code_src_key'
           ELSE 'Data Matched for column pending_code_src_key'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_workdb.dwh_f_incident_task_c f
   LEFT OUTER JOIN intuit_workdb.dwh_d_lov l ON f.pending_code_src_code = l.dimension_code
   AND l.dimension_class ='PENDING_CODE~U_INCIDENT_TASK'
   WHERE CASE WHEN f.pending_code_src_code IS NULL THEN '0' ELSE CASE WHEN l.dimension_code IS NULL THEN '-1' ELSE l.row_key END END <> f.pending_code_src_key)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column repair_date_on_c.'
           ELSE 'Data Matched for column repair_date_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_repair_date,' ') <> coalesce(i.repair_date_on_c,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column repair_date_on_c'
           ELSE 'Data Matched for column repair_date_on_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE CONVERT_TZ(coalesce(u_repair_date,' '),'GMT','America/New_York') <> coalesce(i.repair_date_on_c,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column repair_duration_c.'
           ELSE 'Data Matched for column repair_duration_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_time_to_repair),'0') <> coalesce(i.repair_duration_c,'0'))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_time_to_repair'
           ELSE 'Data Matched for column u_time_to_repair'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',s.u_time_to_repair) <> i.repair_duration_c)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_solution_timestamp.'
           ELSE 'Data Matched for column u_solution_timestamp'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   WHERE coalesce(s.u_solution_timestamp COLLATE utf8_unicode_ci,' ') <> coalesce(i.solution_duration_c,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_time_to_solution.'
           ELSE 'Data Matched for column u_time_to_solution'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE timestampdiff(SECOND,'1970-01-01 00:00:00',coalesce(s.u_time_to_solution,'0')) <> i.solution_duration_c)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_solution_timestamp'
           ELSE 'Data Matched for column u_solution_timestamp'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci = i.row_id
   WHERE CONVERT_TZ(coalesce(u_solution_timestamp,' '),'GMT','America/New_York') <> coalesce(i.Solution_on_c,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_solution_timestamp.'
           ELSE 'Data Matched for column u_solution_timestamp'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance=i.source_id
   WHERE coalesce(DATE_FORMAT(CONVERT_TZ(s.u_solution_timestamp,'GMT','America/New_York'),'%Y%m%d'),'0') <> i.solution_on_key_c <> coalesce(i.solution_on_key_c,' '))A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_start_date'
           ELSE 'Data Matched for column u_start_date'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE u_start_date <> i.started_on_c) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_start_date EST'
           ELSE 'Data Matched for column u_start_date EST'
       END AS Message
FROM
  (SELECT count(*) as cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_d_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE CONVERT_TZ(coalesce(u_start_date,' '),'GMT','America/New_York') <> coalesce(i.started_on_c,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_start_date'
           ELSE 'Data Matched for column u_start_date'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE DATE_FORMAT(CONVERT_TZ(coalesce(u_start_date,'0'),'GMT','America/New_York'),'%Y%m%d') <> i.started_on_key_c)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_symptom.'
           ELSE 'Data Matched for column u_symptom'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.incident_final s
   INNER JOIN intuit_workdb.dwh_f_incident i ON s.sys_id COLLATE utf8_unicode_ci=i.row_id
   AND s.sourceinstance = i.source_id
   WHERE coalesce(s.u_symptom COLLATE utf8_unicode_ci,' ') <> coalesce(i.symptom_src_code_c,' ')) A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column symptom_src_code_c.'
           ELSE 'Data Matched for column symptom_src_code_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_workdb.dwh_f_incident f
   LEFT OUTER JOIN intuit_workdb.dwh_d_lov l ON f.symptom_src_code_c = l.dimension_code
   AND l.dimension_class ='SYMPTOM~INCIDENT'
   WHERE CASE WHEN f.symptom_src_code_c IS NULL THEN '0' ELSE CASE WHEN l.dimension_code IS NULL THEN '-1' ELSE l.row_key END END<>f.symptom_src_key_c)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_bufg12_c'
           ELSE 'Data Matched for column u_bufg12_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.cmdb_ci_final a
   INNER JOIN intuit_workdb.dwh_d_configuration_item b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id 
   #and a.sourceinstance=b.source_id and b.row_key < 500
   LEFT OUTER JOIN intuit_mdsdb.u_bufg_final c ON coalesce(a.u_bufg_l2 COLLATE utf8_unicode_ci) = c.sys_id
   WHERE CASE WHEN a.u_bufg_l2 IS NULL THEN '0' ELSE CASE WHEN c.sys_id IS NULL THEN '-1' ELSE c.u_name END END COLLATE utf8_unicode_ci <> b.u_bufg12_c)A;

SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_bufg13_c'
           ELSE 'Data Matched for column u_bufg13_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.cmdb_ci_final a
   INNER JOIN intuit_workdb.dwh_d_configuration_item b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id 
   #and a.sourceinstance=b. source_id and b.row_key < 500
   LEFT OUTER JOIN intuit_mdsdb.u_bufg_final c ON coalesce(a.u_bufg_l3 COLLATE utf8_unicode_ci) = c.sys_id
   WHERE CASE WHEN a.u_bufg_l3 IS NULL THEN '0' ELSE CASE WHEN c.sys_id IS NULL THEN '-1' ELSE c.u_name END END COLLATE utf8_unicode_ci <> b.u_bufg13_c)A;