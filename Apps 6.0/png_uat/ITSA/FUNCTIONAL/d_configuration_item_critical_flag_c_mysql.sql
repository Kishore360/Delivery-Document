SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdwdb.d_configuration_item as dci 
inner join png_mdwdb.d_png_critical_business_services_c as pcb
on dci.correlation_id_c = pcb.correlation_id and dci.source_id = pcb.source_id
join (select source_id,max(date_format(lastupdated,'%Y-%m-%d')) as lastupdated  from png_mdwdb.d_o_data_freshness group by source_id) as odf
ON  pcb.source_id = odf.source_id 
where  dci.critical_flag_c <> case when end_date is null then 'Y'
							when end_date is not null and STR_TO_DATE(pcb.end_date, '%Y%m%d') > odf.lastupdated then 'Y'
							else 'N' end
) temp;