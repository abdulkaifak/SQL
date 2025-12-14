-- Consumer_Preferences Table – Conclusion
-- Insight: Cuisine popularity highlights demand trends.

-- WHERE: Which consumers prefer Mexican or Italian cuisine?
SELECT consumer_id, preferred_cuisine
FROM consumer_preferences
WHERE preferred_cuisine IN ('Mexican','Italian');

-- GROUP BY: How many consumers prefer each cuisine?
SELECT preferred_cuisine, COUNT(*) AS total_consumers
FROM consumer_preferences
GROUP BY preferred_cuisine;

-- JOIN: Match consumers with restaurants offering their preferred cuisine.
SELECT c.consumer_id, cp.preferred_cuisine, r.name
FROM consumer_preferences cp
JOIN restaurant_cuisines rc ON cp.preferred_cuisine = rc.cuisine
JOIN restaurants r ON rc.restaurant_id = r.restaurant_id
JOIN consumers c ON cp.consumer_id = c.consumer_id;

-- Window Function: Show cuisine preference percentage.
SELECT preferred_cuisine,
       COUNT(*) AS total,
       COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM consumer_preferences
GROUP BY preferred_cuisine;
