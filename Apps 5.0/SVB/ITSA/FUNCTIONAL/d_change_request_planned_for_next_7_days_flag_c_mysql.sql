 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_change_request d 
JOIN svb_mdwdb.d_o_data_freshness dat ON d.source_id = dat.source_id  AND dat.etl_run_number = (select etl_run_number from svb_mdwdb.d_o_data_freshness where  lastupdated = (select  max(lastupdated) from  svb_mdwdb.d_o_data_freshness))
where  CASE WHEN d.planned_end_on BETWEEN DATE_FORMAT(dat.lastupdated,'%Y%m%d') AND DATE_ADD(DATE_FORMAT(dat.lastupdated,'%Y%m%d'),INTERVAL 7 day) THEN 'Y' ELSE 'N' END <>d.planned_for_next_7_days_flag_c )