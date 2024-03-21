SELECT person_order.order_date, person.name || ' (age:' || person.age || ')' AS person_information
FROM person_order, person
WHERE person_order.person_id = person.id
ORDER BY person_order.order_date, person_information;