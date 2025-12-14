-- Restaurants Table – Conclusion
-- Insight: Restaurant attributes affect consumer choices.

-- WHERE: Which restaurants in Mexico have price = High?
SELECT restaurant_id, name, price
FROM restaurants
WHERE country = 'Mexico' and price="High";


-- GROUP BY: How many restaurants are in each city?
SELECT city, COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY city;

-- Subquery: Which restaurants are priced above average?
SELECT restaurant_id, name, price
FROM restaurants
WHERE price > (SELECT MIN(price) FROM restaurants);

-- Window Function: Rank restaurants by price within each city.
SELECT restaurant_id, city, price,
       DENSE_RANK() OVER (PARTITION BY city ORDER BY price DESC) AS price_rank
FROM restaurants;

