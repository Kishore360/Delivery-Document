SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt FROM rogers6_mdwdb.d_schedule_span_c d 
left JOIN rogers6_mdsdb.cmn_schedule_span_final p ON d.row_id=p.sys_id
where (case when all_day is null then 'UNSPECIFIED' when all_day=1 then 'Y' else 'N' end) <> all_day_c and p.cdctype <>'D'  )a ;
