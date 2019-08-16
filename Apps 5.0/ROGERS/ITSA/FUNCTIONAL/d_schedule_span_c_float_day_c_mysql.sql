

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.d_schedule_span_c d 
JOIN rogers_mdsdb.cmn_schedule_span_final p ON d.row_id=p.sys_id
where float_day <> float_day_c  )a
