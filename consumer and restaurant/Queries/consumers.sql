-- Consumers Table – Conclusion
-- Insight: Budget segments and demographics influence dining behavior.

-- WHERE: Which consumers in San Luis Potosi have a High budget?
SELECT consumer_id, city, budget
FROM consumers
WHERE city = 'San Luis Potosi' AND budget = 'High';

-- GROUP BY: How many consumers are in each marital status category?
SELECT marital_status, COUNT(*) AS total_consumers
FROM consumers 
GROUP BY marital_status;

-- JOIN: What cuisines do High budget consumers prefer?
SELECT c.consumer_id, c.budget, cp.preferred_cuisine
FROM consumers c
JOIN consumer_preferences cp ON c.consumer_id = cp.consumer_id
WHERE c.budget = 'High';

-- Subquery: Which consumers are older than the average age?
SELECT consumer_id, age
FROM consumers
WHERE age > (SELECT AVG(age) FROM consumers);

-- CTE: Categorize parents into age groups.

-- Window Function: Rank consumers by age.
SELECT consumer_id, age,
       dense_rank() OVER (ORDER BY age DESC) AS age_rank
FROM consumers;
