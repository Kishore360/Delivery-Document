SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message

from mercuryins_mdsdb.problem_final SRC
join
mercuryins_mdwdb.d_problem TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where 
case when u_bcp_event = 1 then 'Y' else 'N' end<>TRGT.bcp_event_c_flag