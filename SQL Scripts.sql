USE mavenmovies;

-- Question 1
select monthname(rental_date) as Rental_Month, avg(rental_rate) as Average_Revenue, 
count(rental_id) as Count_of_Rentals, sum(rental_rate) as Sum_of_Rentals from rental 
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
group by Rental_Month;

-- Question 2
select hour(rental_date) as Hour, count(payment_id) as Count_of_Transactions from rental
inner join payment on rental.rental_id = payment.rental_id
group by Hour order by Hour;

-- Question 3
select title, count(rental_id) as Count_of_Rental from film 
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by title order by Count_of_Rental desc limit 10;

-- Question 4
select name, count(rental_id) as Count_of_Rental from category 
inner join film_category on category.category_id = film_category.category_id
inner join film on film_category.film_id = film.film_id
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by name;

-- Question 5
select store.store_id, manager_staff_id, address.address_id, address, sum(rental_rate) as Rental_Revenue 
from store inner join inventory on store.store_id = inventory.store_id
inner join film on inventory.film_id = film.film_id
inner join address on store.address_id = address.address_id
group by store_id order by Rental_Revenue desc limit 1;

-- Question 6
select staff.staff_id, concat(first_name," ",last_name) as Staff_Name, count(rental_id) as Count_of_Rentals 
from staff inner join rental on staff.staff_id = rental.staff_id 
group by staff_id;