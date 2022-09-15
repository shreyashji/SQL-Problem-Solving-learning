with recursive cte as (
	SELECT 1 AS cnt              #ANCHOR QUERY
    UNION ALL                    #SEPRATOR
    SELECT cnt+1 FROM cte        #RECURSIVE QUERY 
    WHERE cnt<10                 #TERMINATION CHECK
)
SELECT * FROM cte
#option(maxrecursion 0) -- in ssms