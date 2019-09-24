

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (

select count(1) cnt
        FROM
     rogers_mdwdb.d_schedule_span_c d 
JOIN rogers_mdsdb.cmn_schedule_span_final p ON d.row_id=p.sys_id
where 
convert_tz(date_format(str_to_date(start_date_time,
            '%Y%m%dT%H%i%S'),
            '%Y-%m-%d %H-%i-%s '),'GMT','America/New_York') <> start_date_time_c
and p.cdctype='X' )a