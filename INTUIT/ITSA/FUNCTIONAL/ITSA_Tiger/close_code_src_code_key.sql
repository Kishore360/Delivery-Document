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