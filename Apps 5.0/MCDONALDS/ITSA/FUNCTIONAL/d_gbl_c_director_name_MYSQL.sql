select 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_gbl_c.director_name' ELSE 'SUCCESS' END as Message
 from mcdonalds_mdsdb.u_gbl_final src
left join mcdonalds_mdsdb.sys_user_final lkp on src.u_director = lkp.sys_id
left join mcdonalds_mdwdb.d_gbl_c trg on trg.row_id=src.sys_id
where COALESCE(lkp.name,'UNSPECIFIED')<>trg.director_name and src.CDCTYPE<>'D'