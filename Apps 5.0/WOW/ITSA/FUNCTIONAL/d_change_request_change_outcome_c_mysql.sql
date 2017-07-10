 SELECT CASE WHEN count(1) > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message  from 
wow_mdsdb.change_request_final  src
 JOIN  wow_mdwdb.d_change_request trgt
on trgt.row_id= src.sys_id and trgt.source_id = src.sourceinstance
where trgt.change_outcome_c<>src.u_change_outcome;





