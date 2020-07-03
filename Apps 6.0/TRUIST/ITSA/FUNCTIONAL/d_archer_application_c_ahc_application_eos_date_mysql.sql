select case when count(1)>1 then 'Failure' else 'Success' end as Result,
case when count(1)>1 then 'Data mismatch for d_archer_application_c.ahc_application_eos_date' else 'Success' end as Message
/* select distinct src.application_id,src.application_name,trgt.vendor_end_of_support_date_c,
trgt.vendor_extended_support_end_date_c,o_data.lastupdated,case when src.application_name like '%Microsoft%' or src.application_name like '%Windows%' 
then coalesce(trgt.vendor_extended_support_end_date_c,trgt.vendor_end_of_support_date_c) else trgt.vendor_end_of_support_date_c end exp_date,
trgt.ahc_application_eos_date,trgt.ahc_application_eos_state*/
from truist_mdsdb.app_vwarchertonumerifyfeed_final src
join (select max(lastupdated) as lastupdated,source_id from truist_mdwdb.d_o_data_freshness a group by source_id) o_data
on (src.sourceinstance=o_data.source_id )and src.cdctype='X'
join truist_mdwdb.d_archer_application_c trgt
on src.Application_id=trgt.row_id and src.sourceinstance=trgt.source_id
where case when src.application_name like '%Microsoft%' or src.application_name like '%Windows%' 
then coalesce(trgt.vendor_extended_support_end_date_c,trgt.vendor_end_of_support_date_c) 
else trgt.vendor_end_of_support_date_c end<>trgt.ahc_application_eos_date ;