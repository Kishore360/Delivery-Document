SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.avg_time_to_respond_c' ELSE 'SUCCESS' END as Message
FROM 
watson_mdwdb.f_case fi 
inner join watson_mdwdb.d_case di on di.row_key=fi.case_key
inner join ( select documentkey ,oldvalue,newvalue, min(sys_created_on) as sys_created_on from 
(select documentkey,sys_created_on,newvalue,oldvalue
 from watson_mdsdb.sys_audit_final a 
 inner join (select name,element,value,label from watson_mdsdb.sys_choice_final where element='state' and name='sn_customerservice_case' )lov_old
 on lov_old.value=a.oldvalue
 inner join (select name,element,value,label from watson_mdsdb.sys_choice_final where element='state' and name='sn_customerservice_case' )lov_new
 on lov_new.value=a.newvalue
 where tablename='sn_customerservice_case' and fieldname = 'state' )A
 where oldvalue=1 group by 1,2,3 )r on di.row_id=r.documentkey
where fi.avg_time_to_respond_c <> timestampdiff(second, di.opened_on, r.sys_created_on)
 ;