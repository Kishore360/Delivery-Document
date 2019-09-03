 --  same employee_number are tagged to the multiple employees.Will remove if this is an process issues`-DELV-16936
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM
(
select distinct caller_id,b2.row_key,opened_by_c_key,d.row_id,a.sys_id,d.soft_deleted_flag,a.cdctype,
coalesce(b2.row_key,case when caller_id is null then 0 else -1 end ) as b
 from rogers_mdwdb.d_incident d join rogers_mdsdb.incident_final a on d.row_id=a.sys_id and d.source_id=a.sourceinstance
left  join rogers_mdwdb.d_internal_contact b2 on coalesce(concat('INTERNAL_CONTACT~',a.caller_id),'UNSPECIFIED')=b2.row_id
where opened_by_c_key<>coalesce(b2.row_key,case when caller_id is null then 0 else -1 end )
and d.soft_deleted_flag='N') a;



