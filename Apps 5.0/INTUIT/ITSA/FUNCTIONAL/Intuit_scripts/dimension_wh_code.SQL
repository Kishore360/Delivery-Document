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