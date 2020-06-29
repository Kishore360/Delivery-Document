select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.cir_case_associated_c' ELSE 'SUCCESS' END as Message
  from ibmwatson_mdsdb.incident_final i
  join ibmwatson_mdwdb.d_incident di on di.row_id=i.sys_id and i.sourceinstance=di.source_id
left join ibmwatson_mdsdb.sn_customerservice_case_final sn on i.sys_id=sn.parent 
left join (select ptf.problem,sum(case when ptf.short_description like '% CIR %' then 1 else 0 end) flag_key from ibmwatson_mdsdb.problem_task_final ptf  group by 1) tp on tp.problem = i.problem_id
where   di.cir_case_associated_c <> (coalesce(cir_case_associated_c,case when sn.parent is null then 'Incident With No Case Associated' 
 else (case when tp.flag_key >0 then 'Incident With Cases and CIR' else'Incident With Cases but No CIR' end ) end))
 and sn.cdctype<>'D' and i.CDCTYPE<>'D'