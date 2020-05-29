SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message from(
  select count(1) cnt from wpl_mdsdb.incident_final incident
left join wpl_mdwdb.f_incident f on incident.sys_id= f.row_id and incident.sourceinstance=f.source_id
join wpl_mdwdb.d_lov_map lv on f.state_src_key=lv.src_key and lv.dimension_wh_code in  ('RESOLVED','CLOSED')

where (case 
            when lv.dimension_wh_code='CLOSED' THEN case 
                when coalesce( (                CONVERT_TZ( CASE 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~INCIDENT' 
                        AND d_lov_map.dimension_code = incident.state 
                        AND d_lov_map.source_id = incident.sourceinstance),
                    'UNKNOWN') = 'OPEN' then NULL 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~INCIDENT' 
                        AND d_lov_map.dimension_code = incident.state 
                        AND d_lov_map.source_id = incident.sourceinstance),
                    'UNKNOWN') in ('CLOSED') then  coalesce(incident.resolved_at,
                    incident.sys_updated_on ) 
                end ,
                'GMT',
                'America/New_York')),
                (CONVERT_TZ (incident.sys_updated_on,
                'GMT',
                'America/New_York')))<(                CONVERT_TZ(incident.opened_at,
                'GMT',
                'America/New_York')) then null 
                else TIMESTAMPDIFF(SECOND,
                CONVERT_TZ((                CONVERT_TZ(incident.opened_at,
                'GMT',
                'America/New_York')),
                'America/New_York',
                'GMT'),
                CONVERT_TZ(coalesce((                CONVERT_TZ( CASE 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~INCIDENT' 
                        AND d_lov_map.dimension_code = incident.state 
                        AND d_lov_map.source_id = incident.sourceinstance),
                    'UNKNOWN') = 'OPEN' then NULL 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        wpl_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'STATE~INCIDENT' 
                        AND d_lov_map.dimension_code = incident.state 
                        AND d_lov_map.source_id = incident.sourceinstance),
                    'UNKNOWN') in ('CLOSED') then  coalesce(incident.resolved_at,
                    incident.sys_updated_on ) 
                end ,
                'GMT',
                'America/New_York')),
                (CONVERT_TZ (incident.sys_updated_on,
                'GMT',
                'America/New_York'))),
                'America/New_York',
                'GMT')) 
            end 
            ELSE NULL 
        END)<> f.open_to_close_duration and incident.cdctype<>'D'
        

 
)a;