

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ibm_customer_memory_uses.uses_date_key_c' ELSE 'SUCCESS' END as Message FROM 
(select f.Name ful_name,f.timestamp,f.memory_usage IBM_usage,'Memory Usage' flag,f.cdctype,f.sourceinstance from wpl_mdsdb.us_vmware_memory_usage_final f
union all
select  c.Name ful_name,c.timestamp,c.cpu_usage IBM_usage,'CPU Usage' flag,c.cdctype,c.sourceinstance   from wpl_mdsdb.us_vmware_cpu_usage_final c)cm
left join wpl_mdwdb.d_ibm_customer_memory_uses TRGT
on concat(cm.ful_name,'~',DATE_FORMAT(str_to_date(cm.timestamp,'%M %d,%Y %r'), '%Y%m%d%H%i%s%p'))=TRGT.row_id and TRGT.source_id=cm.sourceinstance and cm.cdctype='X'
left join wpl_mdwdb.d_Calendar_date lkp
on (COALESCE(date_format(convert_tz(cm.timestamp,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') = LKP.row_id )
where  COALESCE(lkp.row_key,CASE WHEN cm.timestamp IS NULL THEN 0 else -1 end)<>TRGT.uses_date_key_c				
			