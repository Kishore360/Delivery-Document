
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt  from (
 select  distinct CASE WHEN (a.work_start is null  and a.start_date is null) or a.sys_created_on is null then 0  
WHEN COALESCE(convert_tz(a.work_start,'GMT','America/New_York'), convert_tz(a.start_date,'GMT','America/New_York'))  >  
convert_tz(a.sys_created_on,'GMT','America/New_York')
 then TIMESTAMPDIFF(SECOND, a.sys_created_on,COALESCE(a.work_start,a.start_date))
else 0  end as  lead_time_src ,lead_time from
 png_mdsdb.change_request_final a
left join
png_mdsdb.sys_user_group_final  b
on a.assignment_group=b.sys_id and a.sourceinstance=b.sourceinstance
join
png_mdwdb.d_calendar_date d
on greatest(COALESCE(DATE_FORMAT(convert_tz(coalesce(a.opened_at,a.sys_created_on),'GMT','America/New_York'),'%Y%m%d'),0),
COALESCE(DATE_FORMAT(CONVERT_TZ(CASE when a.state=3 then  coalesce(a.closed_at,a.sys_updated_on ) else 0 end ,
'GMT','America/New_York') ,'%Y%m%d'),0))=d.row_id
join png_mdwdb.d_change_request d1 on a.sys_id=d1.row_id and a.sourceinstance=d1.source_id
join  png_mdwdb.d_change_failure f on d1.row_key=f.change_request_key 
where a.cdctype='X' AND  ( a.state in (-1,-3,1,-2,0,-5,-4,-6)) 
)a
where lead_time_src<>lead_time)b;


