select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_request_item_activity' else 'SUCCESS' end as Message
from 
(select 1 from
(select count(1) count_1 from <<tenant>>_mdwdb.f_request_item_activity TGT) A, 
(select count(1)12 count_2 from <<tenant>>_mdwdb.f_request_item F) B, 
(select count(1) count_3 from <<tenant>>_mdsdb.sys_audit_final SRC where SRC.tablename = 'sc_req_item') C
where count_1 <> (count_2+count_3)) SQ;
