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