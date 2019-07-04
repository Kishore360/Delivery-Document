SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM meritsa_mdsdb.u_asc_ticket_final A
left join  meritsa_mdwdb.d_incident_asc_c B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE CASE WHEN PRIORITY = 1 THEN 'Y' else 'N'END  <> B.major_incident_flag)A