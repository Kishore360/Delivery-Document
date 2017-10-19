 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
     FROM watson_mdsdb.change_request_final i
  join watson_mdwdb.d_change_request f on sys_id=f.row_id and sourceinstance=source_id
 where f.outage_duration_c<>TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',i.u_outage_duration)
 
 