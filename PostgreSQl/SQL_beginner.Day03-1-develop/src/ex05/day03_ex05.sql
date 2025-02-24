WITH step_visit AS
	(SELECT pizzeria.name FROM person_visits
	JOIN person ON person_visits.person_id = person.id
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	WHERE person.name = 'Andrey'),
step_order AS
	(SELECT pizzeria.name FROM person_order
	JOIN person ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE person.name = 'Andrey')
SELECT name AS pizzeria_name
FROM (
	SELECT * FROM step_visit EXCEPT ALL SELECT * FROM step_order) AS test
ORDER BY pizzeria_name;