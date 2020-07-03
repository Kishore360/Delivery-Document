select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from truist_mdsdb.app_vwarchertonumerifyfeed_final a
join truist_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where case when timestampdiff(month,(select max(lastupdated) from truist_mdwdb.d_o_data_freshness where source_id = 2),case when ((upper(Application_Name) like '%WINDOWS%' or upper(Application_Name) like '%MICROSOFT%')) and Vendor_Extended_Support_end_date is not null then  Vendor_Extended_Support_end_date  else Vendor_End_of_Support_date end)>36 then  'GREEN'
when timestampdiff(month,(select max(lastupdated) from truist_mdwdb.d_o_data_freshness where source_id = 2),case when ((upper(Application_Name) like '%WINDOWS%' or upper(Application_Name) like '%MICROSOFT%')) and Vendor_Extended_Support_end_date is not null then  Vendor_Extended_Support_end_date  else Vendor_End_of_Support_date end)>18 
and timestampdiff(month,(select max(lastupdated) from truist_mdwdb.d_o_data_freshness where source_id = 2),case when ((upper(Application_Name) like '%WINDOWS%' or upper(Application_Name) like '%MICROSOFT%')) and Vendor_Extended_Support_end_date is not null then  Vendor_Extended_Support_end_date  else Vendor_End_of_Support_date end)<=36  then  'YELLOW'
when timestampdiff(month,(select max(lastupdated) from truist_mdwdb.d_o_data_freshness where source_id = 2),case when ((upper(Application_Name) like '%WINDOWS%' or upper(Application_Name) like '%MICROSOFT%')) and Vendor_Extended_Support_end_date is not null then  Vendor_Extended_Support_end_date  else Vendor_End_of_Support_date end)<=18 then 'RED' else 'WHITE' end<>b.AHC_Application_EOS_State
and a.cdctype='X';