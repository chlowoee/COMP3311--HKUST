SELECT D.test#, D.plane_reg#
FROM Done_by D
JOIN Test T ON D.test# = T.test# AND D.plane_reg# = T.plane_reg#
WHERE D.done_date < TO_DATE('20231001', 'YYYYMMDD')
AND T.score = (SELECT MAX(score) FROM Test);

SELECT T.employee_ID, T.tech_name, P.phone#
FROM Technician_Table T
JOIN Technician_phone P ON T.employee_ID = P.employee_ID
WHERE T.city = 'New York'
    AND T.skill_level = 8;
    
SELECT M.model#, M.capacity, M.weight
FROM Model M
JOIN Plane P ON M.model# = P.model#
GROUP BY M.model#, M.capacity, M.weight
HAVING COUNT(P.plane_reg#) > 500;

SELECT P.plane_reg#, T.test#, T.test_name
FROM Plane P
JOIN Test T ON P.plane_reg# = T.plane_reg#
JOIN Done_By D ON T.test# = D.test#
WHERE EXTRACT(MONTH FROM D.done_date) <> 10;

SELECT T.plane_reg#, T.test#, T.score
FROM Test T
JOIN Done_by D ON T.test# = D.test# AND T.plane_reg# = D.plane_reg# AND T.model# = D.model#
WHERE T.test_name = 'Controller System Test'
AND D.employee_ID = '12345678'
AND D.employee_ID <> '23456789';