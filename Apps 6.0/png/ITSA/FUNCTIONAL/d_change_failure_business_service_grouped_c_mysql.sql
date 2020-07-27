select case when cnt>0 then 'Failure' else 'Success' end as Result,
 case when cnt>0 then 'Data Mismatch' else 'Success' end as Message
 from(
select count(1) cnt from (
-- select * from (
select change_request.number,bs.name as n1,coalesce(bs.name,'UNSPECIFIED'), 
case when coalesce(bs.name,'UNSPECIFIED')= 'GBS Financial Management Services' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'FSS-Forecasting & Reporting' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Security Architecture & Engineering' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Insider Risk' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'CDS C Customer Data Analytics Solutions' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - SMO Retail Execution Alerts' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'Platform Security' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'FSS-Innovation' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - DM Harmonize & Store' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'PSSS & TO - OPS-IT&OT' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD BI Analytics' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS.OpExGov.Application Management Services' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Global People Mobility' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Authentication Management' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'PSSS & TO - Order Management Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - GPMS Delivery Center' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CS - Brand Equity Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-Global Service' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD - C Customer Relationship Mgmt' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Identity Management Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Content Creation & Storage' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Employee Care HR' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'DBCE - Direct to Consumer Selling (DTCS)' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - End Point Devices' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - SMO Store Execution Analytics' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MY PG SERVICES-Meeting Services' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - US Benefits' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Expat Payroll & Relo Acct' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - SMO Marketscope' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Network Security' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - BI CS Media Mgt' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Non-US Benefits' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - MMS' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Employee Care' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - IT GRC Focus Areas' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Managed Print Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CDO - SAP Information Security' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Site Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Threat Management' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Data Fabric' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Data Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'UNSPECIFIED' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD - C Account Management' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - Enterprise ILM' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Other Reporting Service' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Content Sharing & Social' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Access Management Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Vulnerability Service' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Security Ops Center' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - DM Data Capture' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - SMO Fastmart/SER' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Talent Management' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Equity Administration' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - SMO RTDC' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Global SalaryPlan&Perf Awards' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - HR Analytics' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Devops' then 'D&A - Devops'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - PS Data Science & Analytics' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CS - CMK & Media Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Business Mgmt Intelligence' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Fractal Analytics Services' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'CDO - SAP Ecosystem & Platform Archtr' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - RPA Operations & KLO' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'IDQ - Initiative and Design to Print' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'DBCE - Consumer Data Platform' then 'DBCE - Consumer Data Platform'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS.Platforms.Cloud' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'Identity and Access Management Service' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - STC Analytics' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'DBCE - CRM Self Serve Tools' then 'num_group_no_failure'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Employee Data Management' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'IDQ - Quality' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'PTW - OPS-IT Operations' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Communication' then 'num_grouped_others'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-Accounts Receivable Management' then 'FPSS-Accounts Receivable Management'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A - Data Mgmt Customer Data Svcs' then 'D&A - Data Mgmt Customer Data Svcs'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD - C B2B eCommerce' then 'CSD - C B2B eCommerce'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD - C Retail Execution' then 'CSD - C Retail Execution'
when coalesce(bs.name,'UNSPECIFIED')= 'D&A â€“ DevOps' then 'D&A â€“ DevOps'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-Cash & Banking Management' then 'FPSS-Cash & Banking Management'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS â€“ Enterprise Computing' then 'ITS â€“ Enterprise Computing'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-Financial Accounting Reporting Serv' then 'FPSS-Financial Accounting Reporting Serv'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-Source Plan Pay Operations' then 'FPSS-Source Plan Pay Operations'
when coalesce(bs.name,'UNSPECIFIED')= 'CSD - C Trade Funds Management' then 'CSD - C Trade Funds Management'
when coalesce(bs.name,'UNSPECIFIED')= 'MD - Master Data Services' then 'MD - Master Data Services'
when coalesce(bs.name,'UNSPECIFIED')= 'IDQ - Digital Innovation' then 'IDQ - Digital Innovation'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - ITSM Ops & Eng' then 'ITS - ITSM Ops & Eng'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - PC' then 'MYPGS - PC'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - SAP Operations & KLO' then 'ITS - SAP Operations & KLO'
when coalesce(bs.name,'UNSPECIFIED')= 'PSSS & TO - Customer Collaboration' then 'PSSS & TO - Customer Collaboration'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - PS & RD Operations & KLO' then 'ITS - PS & RD Operations & KLO'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Meetings' then 'MYPGS - Meetings'
when coalesce(bs.name,'UNSPECIFIED')= 'DBCE - Digital Presence' then 'DBCE - Digital Presence'
when coalesce(bs.name,'UNSPECIFIED')= 'PSSS & TO - Manufacturing' then 'PSSS & TO - Manufacturing'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - D&A Hosting Platform' then 'ITS - D&A Hosting Platform'
when coalesce(bs.name,'UNSPECIFIED')= 'Autorization Management' then 'Autorization Management'
when coalesce(bs.name,'UNSPECIFIED')= 'FPSS-External Reporting Service' then 'FPSS-External Reporting Service'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - EAI Engineering' then 'ITS - EAI Engineering'
when coalesce(bs.name,'UNSPECIFIED')= 'PTW - Planning Service' then 'PTW - Planning Service'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - Enterprise Computing' then 'ITS - Enterprise Computing'
when coalesce(bs.name,'UNSPECIFIED')= 'PSSS & TO - Order Management IT' then 'PSSS & TO - Order Management IT'
when coalesce(bs.name,'UNSPECIFIED')= 'MYPGS - Global Payroll Serv' then 'MYPGS - Global Payroll Serv'
when coalesce(bs.name,'UNSPECIFIED')= 'PTW - PD-Warehouse Management' then 'PTW - PD-Warehouse Management'
when coalesce(bs.name,'UNSPECIFIED')= 'ITS - Network Infrastructure' then 'ITS - Network Infrastructure'
when coalesce(bs.name,'UNSPECIFIED')= 'PTW - PD-Transportation Service' then 'PTW - PD-Transportation Service'
when coalesce(bs.name,'UNSPECIFIED')= 'UNSPECIFIED' then 'num_group_new_value'

end   business_service_grouped,f.business_service_grouped_c
from png_mdsdb.change_request_final change_request
left join png_mdsdb.cmdb_ci_service_final as bs on change_request.business_service = bs.sys_id and change_request.sourceinstance = bs.sourceinstance and 
 change_request.cdctype<>'D' and bs.cdctype<>'D'
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id and change_request.cdctype<>'D' and change_request.state<>'4'
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
where coalesce(bs.name,'UNSPECIFIED') in (
'GBS Financial Management Services',
'FSS-Forecasting & Reporting',
'Security Architecture & Engineering',
'Insider Risk',
'CDS C Customer Data Analytics Solutions',
'D&A - SMO Retail Execution Alerts',
'Platform Security',
'FSS-Innovation',
'D&A - DM Harmonize & Store',
'PSSS & TO - OPS-IT&OT',
'CSD BI Analytics',
'ITS.OpExGov.Application Management Services',
'MYPGS - Global People Mobility',
'Authentication Management',
'PSSS & TO - Order Management Services',
'MYPGS - GPMS Delivery Center',
'CS - Brand Equity Services',
'FPSS-Global Service',
'CSD - C Customer Relationship Mgmt',
'Identity Management Services',
'MYPGS - Content Creation & Storage',
'MYPGS - Employee Care HR',
'DBCE - Direct to Consumer Selling (DTCS)',
'ITS - End Point Devices',
'D&A - SMO Store Execution Analytics',
'MY PG SERVICES-Meeting Services',
'MYPGS - US Benefits',
'MYPGS - Expat Payroll & Relo Acct',
'D&A - SMO Marketscope',
'Network Security',
'D&A - BI CS Media Mgt',
'MYPGS - Non-US Benefits',
'D&A - MMS',
'MYPGS - Employee Care',
'ITS - IT GRC Focus Areas',
'MYPGS - Managed Print Services',
'CDO - SAP Information Security',
'MYPGS - Site Services',
'Threat Management',
'D&A - Data Fabric',
'D&A - Data Services',
'UNSPECIFIED',
'CSD - C Account Management',
'ITS - Enterprise ILM',
'D&A - Other Reporting Service',
'MYPGS - Content Sharing & Social',
'Access Management Services',
'Vulnerability Service',
'Security Ops Center',
'D&A - DM Data Capture',
'D&A - SMO Fastmart/SER',
'MYPGS - Talent Management',
'MYPGS - Equity Administration',
'D&A - SMO RTDC',
'MYPGS - Global SalaryPlan&Perf Awards',
'MYPGS - HR Analytics',
'D&A - Devops',
'D&A - PS Data Science & Analytics',
'CS - CMK & Media Services',
'D&A - Business Mgmt Intelligence',
'D&A - Fractal Analytics Services',
'CDO - SAP Ecosystem & Platform Archtr',
'ITS - RPA Operations & KLO',
'IDQ - Initiative and Design to Print',
'DBCE - Consumer Data Platform',
'ITS.Platforms.Cloud',
'Identity and Access Management Service',
'D&A - STC Analytics',
'DBCE - CRM Self Serve Tools',
'MYPGS - Employee Data Management',
'IDQ - Quality',
'PTW - OPS-IT Operations',
'MYPGS - Communication',
'FPSS-Accounts Receivable Management',
'D&A - Data Mgmt Customer Data Svcs',
'CSD - C B2B eCommerce',
'CSD - C Retail Execution',
'D&A â€“ DevOps',
'FPSS-Cash & Banking Management',
'ITS â€“ Enterprise Computing',
'FPSS-Financial Accounting Reporting Serv',
'FPSS-Source Plan Pay Operations',
'CSD - C Trade Funds Management',
'MD - Master Data Services',
'IDQ - Digital Innovation',
'ITS - ITSM Ops & Eng',
'MYPGS - PC',
'ITS - SAP Operations & KLO',
'PSSS & TO - Customer Collaboration',
'ITS - PS & RD Operations & KLO',
'MYPGS - Meetings',
'DBCE - Digital Presence',
'PSSS & TO - Manufacturing',
'ITS - D&A Hosting Platform',
'Autorization Management',
'FPSS-External Reporting Service',
'ITS - EAI Engineering',
'PTW - Planning Service',
'ITS - Enterprise Computing',
'PSSS & TO - Order Management IT',
'MYPGS - Global Payroll Serv',
'PTW - PD-Warehouse Management',
'ITS - Network Infrastructure',
'PTW - PD-Transportation Service'

)
)A
where business_service_grouped<>business_service_grouped_c 
)a