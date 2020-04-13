SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.variable_answer_c' ELSE 'SUCCESS' END as Message
FROM 
( Select Count(1) as CNT

FROM rogers6_mdsdb.sc_item_option_mtom_final sc_item_option_mtom 
join rogers6_mdwdb.d_request_item_variable_c TRGT on TRGT.source_id=  sc_item_option_mtom.sourceinstance                 
LEFT OUTER JOIN rogers6_mdsdb.sc_item_option_final sc_item_option 
ON sc_item_option_mtom.sc_item_option=sc_item_option.sys_id 
and sc_item_option_mtom.sourceinstance=sc_item_option.sourceinstance  
LEFT OUTER JOIN rogers6_mdsdb.item_option_new_final item_option_new 
ON sc_item_option.item_option_new=item_option_new.sys_id 
and sc_item_option.sourceinstance=item_option_new.sourceinstance  
LEFT OUTER JOIN (
SELECT  MAX(sys_choice.label) AS label, sys_choice.cdctype AS cdctype,
 sys_choice.sourceinstance AS source_id,concat(coalesce(sys_choice.name,'UNSPECIFIED'),
            coalesce(sys_choice.value,'UNSPECIFIED'),sys_choice.sourceinstance,
            sys_choice.cdctype,coalesce(sys_choice.element,'UNSPECIFIED')) AS row_id,
            sys_choice.value AS value,sys_choice.element AS element,
            sys_choice.name AS name FROM rogers6_mdsdb.sys_choice_final sys_choice         
        WHERE sys_choice.language='en'    
        GROUP BY 2,3,4,5,6,7  
) t_sys_choice_sc_item_option_value_final 
ON item_option_new.choice_table=t_sys_choice_sc_item_option_value_final.name 
and item_option_new.choice_field=t_sys_choice_sc_item_option_value_final.element 
and item_option_new.sourceinstance=t_sys_choice_sc_item_option_value_final.source_id  
LEFT OUTER JOIN (SELECT   concat(coalesce(sys_choice.name,'UNSPECIFIED'),
            coalesce(sys_choice.element,'UNSPECIFIED'),
            coalesce(sys_choice.value,'UNSPECIFIED'),
            sys_choice.cdctype,sys_choice.sourceinstance) AS row_id,
            sys_choice.sourceinstance AS source_id,sys_choice.value AS value,
            sys_choice.cdctype AS cdctype,sys_choice.element AS element,
            MAX(sys_choice.label) AS label,sys_choice.name AS name    
        FROM rogers6_mdsdb.sys_choice_final sys_choice         
        WHERE
            sys_choice.language='en' and sys_choice.name='question' and sys_choice.element='type'    
        GROUP BY 1,2,3,4,5,7) t_sys_choice_item_option_new_type_final 
ON item_option_new.type=t_sys_choice_item_option_new_type_final.value 
and item_option_new.sourceinstance=t_sys_choice_item_option_new_type_final.source_id 
left join rogers6_mdsdb.sys_user_final user on user.sys_id= sc_item_option.value
and sc_item_option.sourceinstance=user.sourceinstance
left join rogers6_mdsdb.sys_user_group_final user_group on user_group.sys_id=sc_item_option.value
and sc_item_option.sourceinstance=user_group.sourceinstance
left join rogers6_mdsdb.cmdb_ci_final cmdb_ci on cmdb_ci.sys_id=sc_item_option.value
and cmdb_ci.sourceinstance=sc_item_option.sourceinstance
left join rogers6_mdsdb.cmn_location_final location on location.sys_id=sc_item_option.value
and location.sourceinstance=sc_item_option.sourceinstance
left join rogers6_mdsdb.core_company_final company on company.sys_id=sc_item_option.value
and company.sourceinstance=sc_item_option.sourceinstance
left join rogers6_mdsdb.cmn_department_final dept on dept.sys_id=sc_item_option.value
and sc_item_option.sourceinstance=dept.sourceinstance     
WHERE sc_item_option.value is not null and 

coalesce(t_sys_choice_sc_item_option_value_final.label,user.name,user_group.name,cmdb_ci.name,location.name,
company.name,dept.name,sc_item_option.value)<>TRGT.variable_answer_c AND TRGT.soft_deleted_flag='N')temp;