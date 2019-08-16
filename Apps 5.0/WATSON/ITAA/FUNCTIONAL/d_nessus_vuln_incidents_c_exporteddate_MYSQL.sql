SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_nessus_vuln_incidents_c.exporteddate ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.us_nessus_vuln_incidents_final src
 left join watson_mdwdb.d_nessus_vuln_incidents_c trgt 
 on src._id=trgt.row_id and src.sourceinstance=trgt.source_id
 where src.exporteddate<>trgt.exporteddate)ma	;
 
 