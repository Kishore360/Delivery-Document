 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.conflict_status' ELSE 'SUCCESS' END as Message
FROM (

select count(1) as cnt

from

meritpa_mdsdb.hp_kcrt_requests_final kcrt_requests

join meritpa_mdsdb.hp_kcrt_fg_pfm_proposal_final kcrt_fg_pfm_proposal on kcrt_requests.REQUEST_ID=kcrt_fg_pfm_proposal.REQUEST_ID AND kcrt_requests.sourceinstance=kcrt_fg_pfm_proposal.sourceinstance

left join meritpa_mdwdb.f_demand TRGT on kcrt_requests.REQUEST_ID=TRGT.row_id

left join meritpa_mdwdb.d_demand LKP on kcrt_requests.REQUEST_ID=LKP.row_id

where  (TRGT.demand_key) <> coalesce(LKP.row_key,case when kcrt_requests.REQUEST_ID is null then 0 else -1 end))a