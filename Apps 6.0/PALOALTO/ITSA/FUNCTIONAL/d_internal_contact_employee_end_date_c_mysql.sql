SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 from paloalto_mdsdb.sys_user_final a
 join paloalto_mdwdb.d_internal_contact b
 on concat('INTERNAL_CONTACT~',a.sys_id)=b.row_id and a.sourceinstance=b.source_id
 where CONVERT_TZ(a.u_end_date,
                'GMT',
                'America/Los_Angeles')<>b.employee_end_date_c;