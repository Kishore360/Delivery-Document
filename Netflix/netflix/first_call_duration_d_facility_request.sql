SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from netflix_mdwdb.d_facility_request a WHERE  TIMESTAMPDIFF(MINUTE,a.opened_on,a.closed_on)<30 and a.first_call_resolution_flag<>'Y'
) c