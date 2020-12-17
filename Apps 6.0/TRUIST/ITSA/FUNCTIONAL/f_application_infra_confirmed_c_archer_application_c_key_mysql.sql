SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_application_infra_confirmed_c.archer_application_c_key' ELSE 'SUCCESS' END as Message
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
left join truist_mdsdb.app_vwarchertonumerifyfeed_final src1 on src.app_id_c=src1.Application_ID
left join truist_mdwdb.d_archer_application_c lkp on src1.Application_ID=lkp.row_id and src1.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,(case when src.app_id is null then 0 else -1 end)) <>tgt.archer_application_c_key)tmp;