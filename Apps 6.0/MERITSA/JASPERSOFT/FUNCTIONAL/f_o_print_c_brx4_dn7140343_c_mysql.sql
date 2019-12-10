
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.o_print_final b  
LEFT JOIN meritsa_mdwdb.f_o_print_c a 
 
ON a.row_id = b.row_date and a.source_id = b.sourceinstance 
where
b.BRX4_DN7140343 <> a.brx4_dn7140343_c;