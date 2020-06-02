

/*****No. of HR changes by opened by***/
SELECT
D.full_name
,count(*)
FROM 
#DWH_TABLE_SCHEMA.f_hr_change HR
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact D
 ON HR.assigned_to_key=D.ROW_KEY
 -- and HR.soft_deleted_flag='N'
group by D.full_name
order by D.full_name;
