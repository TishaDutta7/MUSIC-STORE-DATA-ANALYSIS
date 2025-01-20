# Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
#     Return your list ordered alphabetically by email starting with A.

SELECT DISTINCT 
    customer.email, 
    customer.first_name, 
    customer.last_name, 
    genre.genre_id
FROM customer
JOIN invoice 
    ON invoice.customer_id = customer.customer_id
JOIN invoice_line 
    ON invoice_line.invoice_id = invoice.invoice_id
JOIN track 
    ON track.track_id = invoice_line.track_id
JOIN genre 
    ON genre.genre_id = track.genre_id
ORDER BY customer.email;

# Q2: Let's invite the artists who have written the most rock music in our dataset. 
# Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT 
    artist.artist_id, 
    artist.name AS ArtistName, 
    COUNT(track.track_id) AS NumberOfSongs
FROM track
JOIN album2 
    ON album2.album_id = track.album_id
JOIN artist 
    ON artist.artist_id = album2.artist_id
JOIN genre 
    ON genre.genre_id = track.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY NumberOfSongs DESC
LIMIT 10;

# Q3: Return all the track names that have a song length longer than the average song length. 
# Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 


SELECT 
    name AS TrackName, 
    milliseconds AS SongLength
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) AS AvgTrackLength
    FROM track
)
ORDER BY milliseconds DESC;









