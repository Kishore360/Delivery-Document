

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.adverse_event_info_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT 
from 
png_mdwdb.d_rita_application_c rita_app
JOIN(select fa.rita_application_c_key,group_concat(distinct de.data_element_collected) as data_element_collected, 
case when group_concat(distinct de.data_element_collected) like '%Adverse event information%' then 'Y' else 'N' end as adverse_event_info_flag
from png_mdwdb.f_rita_application_data_elements_c as fa
inner join png_mdwdb.d_png_ot_data_elements_collected_c as de on fa.png_ot_data_elements_collected_c_key = de.row_key
where fa.soft_deleted_flag = 'N'
group by fa.rita_application_c_key)X
ON rita_app.row_key=X.rita_application_c_key
join png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
on (rita_app.row_id=SRC.sys_id and rita_app.source_id=SRC.sourceinstance)
where SRC.cdctype='X' and
X.adverse_event_info_flag = rita_app.adverse_event_info_flag

)temp;





