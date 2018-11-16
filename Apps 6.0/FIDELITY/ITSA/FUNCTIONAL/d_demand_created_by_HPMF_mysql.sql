SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.created_by' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_kcrt_requests_final) SRC
left join  fidelity_mdwdb.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.created_by,'')<>coalesce(TRGT.created_by,'')