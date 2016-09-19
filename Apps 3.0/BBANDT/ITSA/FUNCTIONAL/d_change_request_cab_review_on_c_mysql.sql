<<<<<<< HEAD
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from bbandt_mdsdb.change_request_final a
 left  JOIN   bbandt_mdwdb.d_change_request b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where convert_tz(a.u_cab_review_date,'GMT','America/New_York') <> b.cab_review_on_c) temp;

 
 
=======
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.cab_review_on_c' ELSE 'SUCCESS' END as Message  FROM bbandt_mdsdb.change_request_final SRC  LEFT JOIN bbandt_mdwdb.d_change_request TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(coalesce(SRC.u_cab_review_date),"UTC","America/New_York")<> TRGT.cab_review_on_c;  
>>>>>>> c66a29e374555850ece04e086beca80e1dc83715
