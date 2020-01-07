SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.open_to_close_duration ' ELSE 'SUCCESS' END as Message from(
  select count(1) cnt from wpl_mdsdb.u_ad_hoc_request_final u_ad_hoc_request
left join wpl_mdwdb.f_ad_hoc_request_c f on u_ad_hoc_request.sys_id= f.row_id and u_ad_hoc_request.sourceinstance=f.source_id
join wpl_mdwdb.d_lov_map lv on f.state_src_key=lv.src_key and lv.dimension_wh_code in  ('CLOSED') and lv.dimension_class='STATE~U_AD_HOC_REQUEST'


where (case 
            when lv.dimension_wh_code='CLOSED' THEN case 
                when coalesce( (  CONVERT_TZ( CASE  
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~U_AD_HOC_REQUEST' 
                        AND d_lov_map.dimension_code = u_ad_hoc_request.state 
                        AND d_lov_map.source_id = u_ad_hoc_request.sourceinstance),
                    'UNKNOWN') = ('CLOSED'  ) then  coalesce(u_ad_hoc_request.closed_at,
                    u_ad_hoc_request.sys_updated_on ) 
                    else NULL 
                end ,
                'GMT',
                'America/New_York')),
                ( CONVERT_TZ (u_ad_hoc_request.sys_updated_on,
                'GMT',
                'America/New_York')))<CONVERT_TZ(u_ad_hoc_request.opened_at,
                'GMT',
                'America/New_York') then null 
                else TIMESTAMPDIFF(SECOND,
                CONVERT_TZ(CONVERT_TZ(u_ad_hoc_request.opened_at,
                'GMT',
                'America/New_York'),
                'America/New_York',
                'GMT'),
                CONVERT_TZ(coalesce((  CONVERT_TZ( CASE  
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~U_AD_HOC_REQUEST' 
                        AND d_lov_map.dimension_code = u_ad_hoc_request.state 
                        AND d_lov_map.source_id = u_ad_hoc_request.sourceinstance),
                    'UNKNOWN') = ('CLOSED'  ) then  coalesce(u_ad_hoc_request.closed_at,
                    u_ad_hoc_request.sys_updated_on ) 
                    else NULL 
                end ,
                'GMT',
                'America/New_York')),
                ( CONVERT_TZ (u_ad_hoc_request.sys_updated_on,
                'GMT',
                'America/New_York'))),
                'America/New_York',
                'GMT')) 
            end 
            ELSE NULL 
        END) <>    f.open_to_close_duration and u_ad_hoc_request.cdctype<>'D'
        

 
)a;



	 
