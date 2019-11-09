USE allthethings

IF OBJECT_ID('dbo.People', 'U') IS NOT NULL 
  DROP TABLE dbo.People; 

create table People (
	Id INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Email VARCHAR(50)
);
insert into People (Id, FirstName, LastName, Email) values (1, 'Waylin', 'Storres', 'wstorres0@xrea.com');
insert into People (Id, FirstName, LastName, Email) values (2, 'Dorothee', 'Marsden', 'dmarsden1@live.com');
insert into People (Id, FirstName, LastName, Email) values (3, 'Jaclin', 'Doddemeade', 'jdoddemeade2@google.it');
insert into People (Id, FirstName, LastName, Email) values (4, 'Gwendolin', 'Bittany', 'gbittany3@bluehost.com');
insert into People (Id, FirstName, LastName, Email) values (5, 'Antoinette', 'Woodman', 'awoodman4@berkeley.edu');
insert into People (Id, FirstName, LastName, Email) values (6, 'Norri', 'McCahey', 'nmccahey5@kickstarter.com');
insert into People (Id, FirstName, LastName, Email) values (7, 'Kris', 'Ough', 'kough6@hubpages.com');
insert into People (Id, FirstName, LastName, Email) values (8, 'Delinda', 'Ticehurst', 'dticehurst7@ihg.com');
insert into People (Id, FirstName, LastName, Email) values (9, 'Sayre', 'Ferrucci', 'sferrucci8@auda.org.au');
insert into People (Id, FirstName, LastName, Email) values (10, 'Selene', 'Dore', 'sdore9@creativecommons.org');

IF OBJECT_ID('dbo.Foods', 'U') IS NOT NULL 
  DROP TABLE dbo.Foods; 

create table Foods (
	Id INT,
	PeopleId INT,
	Name VARCHAR(50)
);
insert into Foods (Id, PeopleId, Name) values (1, 1, 'Sole - Iqf');
insert into Foods (Id, PeopleId, Name) values (2, 2, 'Basil - Thai');
insert into Foods (Id, PeopleId, Name) values (3, 3, 'Turkey Leg With Drum And Thigh');
insert into Foods (Id, PeopleId, Name) values (4, 4, 'Soup Campbells Mexicali Tortilla');
insert into Foods (Id, PeopleId, Name) values (5, 5, 'Placemat - Scallop, White');
insert into Foods (Id, PeopleId, Name) values (6, 6, 'Cream Of Tartar');
insert into Foods (Id, PeopleId, Name) values (7, 7, 'Steamers White');
insert into Foods (Id, PeopleId, Name) values (8, 8, 'Wine - White, Colubia Cresh');
insert into Foods (Id, PeopleId, Name) values (9, 9, 'Coffee Guatemala Dark');
insert into Foods (Id, PeopleId, Name) values (10, 10, 'Yukon Jack');
insert into Foods (Id, PeopleId, Name) values (11, 1, 'Apple - Delicious, Red');
insert into Foods (Id, PeopleId, Name) values (12, 2, 'Nut - Almond, Blanched, Ground');
insert into Foods (Id, PeopleId, Name) values (13, 3, 'Turnip - White');
insert into Foods (Id, PeopleId, Name) values (14, 4, 'Wine - White, Schroder And Schyl');
insert into Foods (Id, PeopleId, Name) values (15, 5, 'Tomatoes - Cherry');
insert into Foods (Id, PeopleId, Name) values (16, 6, 'Stock - Beef, White');
insert into Foods (Id, PeopleId, Name) values (17, 7, 'Table Cloth 120 Round White');
insert into Foods (Id, PeopleId, Name) values (18, 8, 'Cheese - Grana Padano');
insert into Foods (Id, PeopleId, Name) values (19, 9, 'Bagelers - Cinn / Brown');
insert into Foods (Id, PeopleId, Name) values (20, 10, 'Yeast - Fresh, Fleischman');
insert into Foods (Id, PeopleId, Name) values (21, 1, 'Juice - Clamato, 341 Ml');
insert into Foods (Id, PeopleId, Name) values (22, 2, 'Sea Bass - Fillets');
insert into Foods (Id, PeopleId, Name) values (23, 3, 'Wine - Charddonnay Errazuriz');
insert into Foods (Id, PeopleId, Name) values (24, 4, 'Duck - Breast');
insert into Foods (Id, PeopleId, Name) values (25, 5, 'Broccoli - Fresh');
insert into Foods (Id, PeopleId, Name) values (26, 6, 'Plasticspoonblack');
insert into Foods (Id, PeopleId, Name) values (27, 7, 'Lumpfish Black');
insert into Foods (Id, PeopleId, Name) values (28, 8, 'Nantucket - Carrot Orange');
insert into Foods (Id, PeopleId, Name) values (29, 9, 'Crab - Back Fin Meat, Canned');
insert into Foods (Id, PeopleId, Name) values (30, 10, 'Potatoes - Pei 10 Oz');
insert into Foods (Id, PeopleId, Name) values (31, 1, 'Croissants Thaw And Serve');
insert into Foods (Id, PeopleId, Name) values (32, 2, 'Veal - Inside, Choice');
insert into Foods (Id, PeopleId, Name) values (33, 3, 'Beef - Top Butt Aaa');
insert into Foods (Id, PeopleId, Name) values (34, 4, 'Flour - Chickpea');
insert into Foods (Id, PeopleId, Name) values (35, 5, 'Vinegar - Cider');
insert into Foods (Id, PeopleId, Name) values (36, 6, 'Arctic Char - Fillets');
insert into Foods (Id, PeopleId, Name) values (37, 7, 'Syrup - Monin - Granny Smith');
insert into Foods (Id, PeopleId, Name) values (38, 8, 'Truffle Shells - White Chocolate');
insert into Foods (Id, PeopleId, Name) values (39, 9, 'Milkettes - 2%');
insert into Foods (Id, PeopleId, Name) values (40, 10, 'Crackers - Soda / Saltins');
insert into Foods (Id, PeopleId, Name) values (41, 1, 'Ostrich - Fan Fillet');
insert into Foods (Id, PeopleId, Name) values (42, 2, 'Dome Lid Clear P92008h');
insert into Foods (Id, PeopleId, Name) values (43, 3, 'Wine - Conde De Valdemar');
insert into Foods (Id, PeopleId, Name) values (44, 4, 'Sprouts - Corn');
insert into Foods (Id, PeopleId, Name) values (45, 5, 'Horseradish - Prepared');
insert into Foods (Id, PeopleId, Name) values (46, 6, 'Lemonade - Natural, 591 Ml');
insert into Foods (Id, PeopleId, Name) values (47, 7, 'Venison - Denver Leg Boneless');
insert into Foods (Id, PeopleId, Name) values (48, 8, 'Pastry - Chocolate Marble Tea');
insert into Foods (Id, PeopleId, Name) values (49, 9, 'Sauce - Marinara');
insert into Foods (Id, PeopleId, Name) values (50, 10, 'Lentils - Green, Dry');
insert into Foods (Id, PeopleId, Name) values (51, 1, 'Cheese - Cheddar, Mild');
insert into Foods (Id, PeopleId, Name) values (52, 2, 'Cinnamon Rolls');
insert into Foods (Id, PeopleId, Name) values (53, 3, 'Bread - Pain Au Liat X12');
insert into Foods (Id, PeopleId, Name) values (54, 4, 'Flour - Buckwheat, Dark');
insert into Foods (Id, PeopleId, Name) values (55, 5, 'Wine - Chateau Timberlay');
insert into Foods (Id, PeopleId, Name) values (56, 6, 'Icecream - Dstk Cml And Fdg');
insert into Foods (Id, PeopleId, Name) values (57, 7, 'Eggplant Oriental');
insert into Foods (Id, PeopleId, Name) values (58, 8, 'Maintenance Removal Charge');
insert into Foods (Id, PeopleId, Name) values (59, 9, 'Ham - Black Forest');
insert into Foods (Id, PeopleId, Name) values (60, 10, 'Cinnamon - Ground');
insert into Foods (Id, PeopleId, Name) values (61, 1, 'Cheese Cloth No 100');
insert into Foods (Id, PeopleId, Name) values (62, 2, 'Spice - Montreal Steak Spice');
insert into Foods (Id, PeopleId, Name) values (63, 3, 'Crackers - Melba Toast');
insert into Foods (Id, PeopleId, Name) values (64, 4, 'Doilies - 5, Paper');
insert into Foods (Id, PeopleId, Name) values (65, 5, 'Squash - Pepper');
insert into Foods (Id, PeopleId, Name) values (66, 6, 'Lemonade - Mandarin, 591 Ml');
insert into Foods (Id, PeopleId, Name) values (67, 7, 'Beef - Short Loin');
insert into Foods (Id, PeopleId, Name) values (68, 8, 'Vaccum Bag - 14x20');
insert into Foods (Id, PeopleId, Name) values (69, 9, 'Table Cloth 53x69 White');
insert into Foods (Id, PeopleId, Name) values (70, 0, 'Creme De Cacao Mcguines');
insert into Foods (Id, PeopleId, Name) values (71, 1, 'Oil - Macadamia');
insert into Foods (Id, PeopleId, Name) values (72, 2, 'Star Anise, Whole');
insert into Foods (Id, PeopleId, Name) values (73, 3, 'Corn - On The Cob');
insert into Foods (Id, PeopleId, Name) values (74, 4, 'Chocolate Eclairs');
insert into Foods (Id, PeopleId, Name) values (75, 5, 'Beef - Ox Tongue');
insert into Foods (Id, PeopleId, Name) values (76, 6, 'Sour Puss Sour Apple');
insert into Foods (Id, PeopleId, Name) values (77, 7, 'Beef Cheek Fresh');
insert into Foods (Id, PeopleId, Name) values (78, 8, 'Onions - Pearl');
insert into Foods (Id, PeopleId, Name) values (79, 9, 'Burger Veggie');
insert into Foods (Id, PeopleId, Name) values (80, 10, 'Water - San Pellegrino');
