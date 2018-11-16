SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_priority_src_key' ELSE 'SUCCESS' END as Message

 from (select *from  fidelity_mdsdb.hp_kcrt_requests_final) SRC left join fidelity_mdwdb.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join fidelity_mdwdb.d_lov lov
on CONCAT('Demand~Priority~',SRC.PRIORITY_CODE) = lov.row_id
where coalesce(lov.row_key,case when SRC.PRIORITY_CODE is null then 0 else -1 end ,'' )<>coalesce(TRGT.demand_priority_src_key,'')