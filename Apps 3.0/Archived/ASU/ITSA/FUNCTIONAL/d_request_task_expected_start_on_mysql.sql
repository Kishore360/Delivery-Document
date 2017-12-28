

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select CONVERT_TZ(A.expected_start,'GMT','US/Mountain') src ,expected_start_on
FROM asu_mdsdb.sc_task_final A
		join asu_mdwdb.d_request_task B on 
		A.sourceinstance=B.source_id 
AND B.ROW_ID=SYS_ID)a
where src<>expected_start_on;



