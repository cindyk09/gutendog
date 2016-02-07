addresses = ["15 William Street, 24H, Financial District, New York",
"33 West 56th Street, 5E, Midtown, New York",
'50 East 80th Street, 2A/3B, Upper East Side, New York',
'82 Charles Street, 1R, West Village, New York',
'2077 Fifth Avenue, 4A, Harlem, New York',
'5 Beekman Street, 42A, Financial District, New York',
'630 First Avenue, 28RS, Murray Hill, New York',
'385 Grand Street, L1004, Lower East Side, New York',
'25-19 43rd Avenue, 206, Long Island City, New York',
'77 Park Terrace East, D75, Inwood, New York',
'240 Riverside Boulevard, 17C, Upper West Side, New York',
'250 East 53rd Street, 3301, Midtown, New York']
User.all.each{|user| user.address1, user.address2, user.city, user.state = addresses.pop.split(", ")}
