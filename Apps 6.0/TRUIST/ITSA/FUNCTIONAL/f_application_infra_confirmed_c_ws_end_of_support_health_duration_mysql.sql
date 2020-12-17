SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_application_infra_confirmed_c.ws_end_of_support_health_duration' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT
from (select a.*,concat('APPID-',a.app_id) as app_id_c,concat(a.app_id,'~',a.app_name,'~',a.infra_resource_name,'~',a.source) as infra_id from
(select a.* from truist_mdsdb.v_app_to_server_to_product_confirmed_final a 
where a.cdctype='X'and a.operational_status in ('Operational','DR Standby')) a join
(select app_id,app_name,infra_resource_name,source,max(sys_updated_on) as sys_updated_on
from truist_mdsdb.v_app_to_server_to_product_confirmed_final
where cdctype='X' and operational_status in ('Operational','DR Standby')
group by 1,2,3,4) b
ON a.app_id = b.app_id
and a.app_name=b.app_name
and a.infra_resource_name = b.infra_resource_name
and a.source =b.source
and a.sys_updated_on = b.sys_updated_on) src
join truist_mdwdb.f_application_infra_confirmed_c tgt on src.infra_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join truist_mdsdb.sa_techportfolio_products_final src1 on src.webserver_product=src1.name
left join truist_mdwdb.d_o_data_freshness df on tgt.source_id=df.source_id and df.soft_deleted_flag='N'
where timestampdiff(SECOND,CONVERT_TZ(df.lastupdated,'America/New_York','GMT'),support_end_date) <>tgt.ws_end_of_support_health_duration)tmp;
