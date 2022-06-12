

with recursive cte_a as(
	#anchor query /base query
    SELECT 'INTERVIEW' AS A,length('INTERVIEW') AS B
    UNION ALL
    #RECURSIVE PART
    SELECT substring(A,1,B-1),B-1 FROM 
    cte_a where B-1 > 0
)
SELECT A FROM cte_a