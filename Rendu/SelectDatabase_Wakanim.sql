select lastname, firstname, email, users_pages.pseudo, users_pages.register_date, users_pages.bio, users_pages.series_followed from users
INNER JOIN users_pages
ON users_pages_id = users_pages.id