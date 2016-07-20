SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from pan_mdwdb.f_change_request a
JOIN pan_mdsdb.change_request_final b 
ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN pan_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.u_peer_reviewer),'UNSPECIFIED')
AND e.source_id=b.sourceinstance
where a.peer_reviewer_c_key<> case when b.u_peer_reviewer is null then 0  ELSE (e.row_key) END;