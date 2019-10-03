SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_demand.project_manager_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT
FROM 
 mercury_mdsdb.hp_kcrt_requests_final kcrt_requests
join mercury_mdsdb.hp_kcrt_fg_pfm_proposal_final kcrt_fg_pfm_proposal on kcrt_requests.REQUEST_ID=kcrt_fg_pfm_proposal.REQUEST_ID AND kcrt_requests.sourceinstance=kcrt_fg_pfm_proposal.sourceinstance
left join  mercury_mdsdb.hp_kcrt_request_details_final kcrt_req_request_details on kcrt_req_request_details.REQUEST_ID=kcrt_requests.REQUEST_ID
 and kcrt_requests.sourceinstance=kcrt_req_request_details.sourceinstance
join  mercury_mdwdb.d_demand TRGT on kcrt_fg_pfm_proposal.REQUEST_ID=TRGT.row_id

where coalesce(kcrt_req_request_details.VISIBLE_PARAMETER4,'UNSPECIFIED')<> TRGT.rating_related_c)a