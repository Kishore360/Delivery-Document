
select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.outage_review_completed_c' ELSE 'SUCCESS' END as Message   from discover_mdsdb.problem_final src 
left join discover_mdwdb.d_problem trg on src.sys_id=trg.row_id
where IF (src.u_outage_review_completed = 1,
                'Y',
                'N') <> trg.outage_review_completed_c ;