SELECT
    t1.Department,
    t1.employee,
    t1.Salary
FROM
        (
            SELECT
            dep.name as Department,
            em.name as Employee,
            em.salary as Salary,
            dense_rank() over (partition by dep.name order by em.salary desc) as rank
        FROM
            Employee em
        LEFT JOIN
            Department dep
        ON
            em.departmentId=dep.id
        ) t1
WHERE 
    t1.rank < 4