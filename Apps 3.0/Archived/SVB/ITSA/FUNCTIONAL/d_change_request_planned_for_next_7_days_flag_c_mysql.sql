
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM
(select count(1)as  cnt from (
select dc.change_request_number,  case when dc.planned_end_on between (select max(date_format(lastupdated,'%Y%m%d')) 
from svb_mdwdb.d_o_data_freshness where source_id = 2) 
and date_add((select max(date_format(lastupdated,'%Y%m%d')) 
from svb_mdwdb.d_o_data_freshness where source_id = 2),INTERVAL 7 day) 
then 'Y' else 'N' end as src,planned_for_next_7_days_flag_c as trgt
from svb_mdwdb.d_change_request as dc) as t
where src<> trgt)a; 

