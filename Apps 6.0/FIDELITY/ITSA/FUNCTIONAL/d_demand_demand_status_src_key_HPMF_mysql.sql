SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_status_src_key' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_kcrt_requests_final) SRC left join (select * from  fidelity_mdsdb.hp_kcrt_statuses_nls_final) SRC1
on SRC.STATUS_ID = SRC1.STATUS_ID  
left join fidelity_mdwdb.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join fidelity_mdwdb.d_lov lov
on CONCAT('Demand~Status~',SRC1.STATUS_ID) = lov.row_id
where coalesce(lov.row_key,'')<>coalesce(TRGT.demand_status_src_key,'') 