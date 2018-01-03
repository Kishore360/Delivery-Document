 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_technical_health_check_c.eit_application_c_key' ELSE 'SUCCESS' END as Message 
FROM (
select  count(1) AS CNT 
FROM bbandt_mdwdb.f_technical_health_check_c a
LEFT JOIN 
(
select tech_hc.*, cal.month_start_date, cal.month_end_date
from bbandt_mdsdb.us_technical_health_check_c_final tech_hc
cross join bbandt_mdwdb.d_calendar_date cal on cal.month_start_date = calendar_date and cal.month_start_date between (select date_format(min(begin),'%Y-%m-01') from bbandt_mdsdb.cmdb_ci_outage_final) and date_format((select max(lastupdated) from bbandt_mdwdb.d_o_data_freshness where sourcename  = 'ServiceNow_Tenant' ),'%Y-%m-01')) appl_cal
on COALESCE(concat(appl_cal.row_id,'~',date_format(appl_cal.month_start_date,'%Y%m%d')),'UNSPECIFIED')=a.row_id and appl_cal.sourceinstance=a.source_id
join
bbandt_mdwdb.d_eit_application_c b
on coalesce(appl_cal.row_id,'UNSPECIFIED')=b.row_id  
where coalesce(b.row_key,case when appl_cal.row_id is null then 0  else -1 end)<> a.eit_application_c_key 
and b.current_flag='Y'
)temp;

