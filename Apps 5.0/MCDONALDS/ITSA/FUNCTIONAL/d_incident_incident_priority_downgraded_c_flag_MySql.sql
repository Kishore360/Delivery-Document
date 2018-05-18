SELECT 
CASE WHEN  cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN  cnt > 0 THEN 'd_inciden.incident_priority_downgraded_c_flag Failed'  ELSE 'SUCCESS' END AS MESSAGE
FROM 
(
SELECT count(1) as cnt  
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final where  cdctype<>'D') SRC
LEFT JOIN 
(SELECT distinct documentkey,sourceinstance,newvalue,oldvalue FROM 
mcdonalds_mdsdb.sys_audit_final where (SRC.cdctime<=f1.lastupdated) and tablename='incident' and fieldname='priority'
and Newvalue> oldvalue ) TA
ON (SRC.sys_id=TA.documentkey AND SRC.sourceinstance=TA.sourceinstance) 
JOIN mcdonalds_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and 
CASE WHEN TA.documentkey is not NULL THEN 'Y' ELSE 'N' END<> TRGT.incident_priority_downgraded_c_flag
)temp;

