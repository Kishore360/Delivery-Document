
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt from (
 select inc.number,inc.cmdb_ci,convert_tz(inc.opened_at,'GMT', 'America/New_York'),chg_opened_at,date_add(chg_opened_at,interval -7 day) ,
 chg.cdctype,ci_incidents_7_days_before_change_c
 from (select sys_id,sourceinstance,cmdb_ci,number,priority,convert_tz(opened_at,'GMT', 'America/New_York') chg_opened_at,cdctype 
 from png_mdsdb.change_request_final where  cdctype='X' )  chg
 left join png_mdsdb.incident_final  inc
 on chg.cmdb_ci = inc.cmdb_ci and chg.sourceinstance = inc.sourceinstance  
 and convert_tz(inc.opened_at,'GMT', 'America/New_York') between 
 date_add(chg_opened_at,interval -7 day) and chg_opened_at
 join png_mdwdb.d_change_request d1 on chg.sys_id=d1.row_id and chg.sourceinstance=d1.source_id
join   png_mdwdb.d_change_failure f on d1.row_key=f.change_request_key 
where 
     inc.cmdb_ci is not null and  chg.priority in (3,4) )b where ci_incidents_7_days_before_change_c<>
     )c;
	 
	 
	 