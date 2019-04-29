 --  same employee_number are tagged to the multiple employees.Will remove if this is an process issues`-DELV-16936
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM
(
select number,employee_number,identification_number,b2.row_id,opened_by_c_key,b2.row_key from rogersdev_mdsdb.incident_final a
left  join rogersdev_mdsdb.sys_user_final b on caller_id=b.sys_id 
left  join rogersdev_mdwdb.d_internal_contact b2 on b2.identification_number=b.employee_number 
left  join rogersdev_mdwdb.d_incident b1 on b1.row_id=a.sys_id 
where opened_by_c_key<>coalesce(b2.row_key,case when employee_number is null then 0 else -1 end )a;


