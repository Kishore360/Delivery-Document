SELECT
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select  count(1) as cnt from
 wpl_mdsdb.u_ad_hoc_request_final u_ad_hoc_request
 left join wpl_mdwdb.f_ad_hoc_request_c b
 on u_ad_hoc_request.sys_id=b.row_id and u_ad_hoc_request.sourceinstance=b.source_id
 left join wpl_mdwdb.d_lov lv on b.state_src_key=lv.row_key and lv.dimension_name='RESLOVED'
 where (CASE
                    WHEN (u_ad_hoc_request.opened_at is null
                    or u_ad_hoc_request.u_adhoc_resolved_dt is null) THEN NULL     
                    WHEN TIMESTAMPDIFF(SECOND,
                    u_ad_hoc_request.opened_at,
                    u_ad_hoc_request.u_adhoc_resolved_dt) < 0 THEN NULL     
                    ELSE TIMESTAMPDIFF(SECOND,
                    u_ad_hoc_request.opened_at,
                    u_ad_hoc_request.u_adhoc_resolved_dt)
                end) <>b.open_to_resolve_duration
     and u_ad_hoc_request.cdctype<>'D'
) ma