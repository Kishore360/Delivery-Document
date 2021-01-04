SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_demand.bup_total_score' 
ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT
FROM 
 meritpa_mdsdb.hp_kcrt_requests_final kcrt_requests
join meritpa_mdsdb.hp_kcrt_fg_pfm_proposal_final kcrt_fg_pfm_proposal on kcrt_requests.REQUEST_ID=kcrt_fg_pfm_proposal.REQUEST_ID AND kcrt_requests.sourceinstance=kcrt_fg_pfm_proposal.sourceinstance
join  meritpa_mdwdb.f_demand TRGT on kcrt_fg_pfm_proposal.REQUEST_ID=TRGT.row_id
where (kcrt_fg_pfm_proposal.PROP_TOTAL_SCORE)<> TRGT.bup_total_score_c)a



