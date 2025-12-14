-- Restaurant_Cuisines Table – Conclusion
-- Insight: Multi‑cuisine restaurants attract broader audiences.

-- WHERE: Which restaurants offer Mexican cuisine?
SELECT restaurant_id, cuisine
FROM restaurant_cuisines
WHERE cuisine = 'Mexican';

-- GROUP BY: How many cuisines does each restaurant offer?
SELECT restaurant_id, COUNT(cuisine) AS cuisine_count
FROM restaurant_cuisines
GROUP BY restaurant_id;

-- JOIN: Show restaurant names and cuisines.
SELECT r.name, rc.cuisine
FROM restaurants r
JOIN restaurant_cuisines rc ON r.restaurant_id = rc.restaurant_id;

-- CTE: Restaurants offering multiple cuisines.
WITH multi_cuisine AS (
  SELECT restaurant_id, COUNT(cuisine) AS cuisine_count
  FROM restaurant_cuisines
  GROUP BY restaurant_id
  HAVING COUNT(cuisine) > 1
)
SELECT r.name, mc.cuisine_count
FROM restaurants r
JOIN multi_cuisine mc ON r.restaurant_id = mc.restaurant_id;
