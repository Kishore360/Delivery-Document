SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.variable_type_c' ELSE 'SUCCESS' END as Message
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
WHERE sc_item_option.value is not null and 

coalesce(t_sys_choice_item_option_new_type_final.label,item_option_new.type)<>TRGT.variable_type_c AND TRGT.soft_deleted_flag='N')temp;