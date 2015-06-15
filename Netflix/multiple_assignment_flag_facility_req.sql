SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from netflix_mdwdb.d_facility_request f where reassignment_count > 1 and f.multiple_assignment_flag <> 'Y' )c;