-- Ratings Table – Conclusion
-- Insight: Ratings reveal service and food quality.

-- WHERE: Which ratings have overall rating >= 1?
SELECT consumer_id, restaurant_id, overall_rating
FROM ratings
WHERE overall_rating >= 1;

-- GROUP BY: Average food rating per restaurant.
SELECT restaurant_id, AVG(food_rating) AS avg_food_rating
FROM ratings
GROUP BY restaurant_id;

-- JOIN: Show restaurant names and average ratings.
SELECT r.name, AVG(rt.overall_rating) AS avg_rating
FROM ratings rt
JOIN restaurants r ON rt.restaurant_id = r.restaurant_id
GROUP BY r.name order by avg_rating desc;
 
-- CTE: Consumers who rated more than 3 restaurants. 
WITH active_reviewers AS (
  SELECT consumer_id
  FROM ratings
  GROUP BY consumer_id
  HAVING COUNT(restaurant_id) > 3
)
SELECT c.consumer_id, c.occupation
FROM consumers c
JOIN active_reviewers ar ON c.consumer_id = ar.consumer_id;
