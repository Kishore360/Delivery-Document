SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') A
 join  <<tenant>>_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and CASE WHEN PRIORITY = 1 THEN 'Y' else 'N'END  <> B.major_incident_flag)A