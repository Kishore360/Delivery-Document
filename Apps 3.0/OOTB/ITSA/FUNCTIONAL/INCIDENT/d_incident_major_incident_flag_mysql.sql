SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM <<tenant>>_mdsdb.incident_final A
 join  <<tenant>>_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE CASE WHEN PRIORITY = 1 THEN 'Y' else 'N'END  <> B.major_incident_flag)A