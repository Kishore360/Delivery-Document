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