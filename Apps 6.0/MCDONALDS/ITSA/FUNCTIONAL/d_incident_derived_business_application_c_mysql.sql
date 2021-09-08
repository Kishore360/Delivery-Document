SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.' ELSE 'SUCCESS' END as Message 
FROM 
( 
select abc,count(1)cnt  from 
(select b.number,e.name,b.short_description,convert_tz(date_format(b.opened_at,'%Y%m%d'),'GMT','US/Central'),
case when (upper(e.name) like  '%CIM%') or  (upper(b.short_description) like '%CIM%' and                                                                                                                                           upper(b.short_description) not like '%DECIMAL%') then 'CIM'
when (e.name = 'Global Mobile Application (GMA)' or e.name = 'McDelivery - Mobile Web Ordering MWOS' or e.name = 'Mobile Application Framework' 
or e.name = 'Mobile Application Penetration Assessment' or e.name = 'Mobile Architecture' or e.name = 'Standard Service (Mobile Architecture)' 
or e.name = 'eCommerce Platform (eCP)' or e.name = 'Digital Middleware' or e.name = 'Global Location Service (GLS)' or e.name = 'Offer Creation Engine (OCE)'
 or e.name = 'Core Customer Platform (CCP)') then 'DIGITAL'
when e.name = 'Self Order Kiosk' then 'KIOSK'
when e.name = 'NEWPOS6 (NP6)' then 'NP6'
when e.name = 'Restaurant File Maintenance 1 (RFM1)' or e.name = 'Restaurant File Maintenance 2 (RFM2)' or upper(b.short_description) like '%RFM%' then 'RFM'
when e.name = 'Digital Engagement Platform (DEP)' or e.name = 'Digital Nutrition Application (DNA)' or e.name = 'Burgey' or e.name = 'Burgey Support Services'
 or e.name = 'Adobe Analytics' or upper(b.short_description) like '%AEM%' then 'DEP'
else 'UNSPECIFIED' end abc
 from mcd_mdsdb.cmdb_ci_service_final e
join mcd_mdsdb.incident_final b on b.subcategory = e.sys_id and b.sourceinstance = e.sourceinstance
-- and convert_tz(date_format(b.opened_at,'%Y%m%d'),'GMT','US/Central')>='20180601'

)a
group by 1 )a
left join 
(
select derived_business_application_c abc ,count(distinct incident_number) cnt from mcd_mdwdb.d_incident
 -- where convert_tz(date_format(created_on,'%Y%m%d'),'GMT','US/Central')>='20180601' 
 group by 1
)b on a.abc=b.abc where a.cnt<>b.cnt;




