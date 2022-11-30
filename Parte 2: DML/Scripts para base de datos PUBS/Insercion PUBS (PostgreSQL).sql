
Insert Into authors
   values('409-56-7008', 'Bennet', 'Abraham', '415 658-9932',
   '6223 Bateman St.', 'Berkeley', 'CA', '94705', 1);

Insert Into authors
   values('213-46-8915', 'Green', 'Marjorie', '415 986-7020',
   '309 63rd St. #411', 'Oakland', 'CA', '94618', 1);

Insert Into authors
   values('238-95-7766', 'Carson', 'Cheryl', '415 548-7723',
   '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1);

Insert Into authors
   values('998-72-3567', 'Ringer', 'Albert', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
Insert Into authors
   values('899-46-2035', 'Ringer', 'Anne', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1);
Insert Into authors
   values('722-51-5454', 'DeFrance', 'Michel', '219 547-9982',
   '3 Balding Pl.', 'Gary', 'IN', '46403', 1);


Insert Into authors
   values('807-91-6654', 'Panteley', 'Sylvia', '301 946-8853',
   '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1);
Insert Into authors
   values('893-72-1158', 'McBadden', 'Heather',
   '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0);
Insert Into authors
   values('724-08-9931', 'Stringer', 'Dirk', '415 843-2991',
   '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0);
Insert Into authors
   values('274-80-9391', 'Straight', 'Dean', '415 834-2919',
   '5420 College Av.', 'Oakland', 'CA', '94609', 1);
Insert Into authors
   values('756-30-7391', 'Karsen', 'Livia', '415 534-9219',
   '5720 McAuley St.', 'Oakland', 'CA', '94609', 1);
Insert Into authors
   values('724-80-9391', 'MacFeather', 'Stearns', '415 354-7128',
   '44 Upland Hts.', 'Oakland', 'CA', '94612', 1);
Insert Into authors
   values('427-17-2319', 'Dull', 'Ann', '415 836-7128',
   '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
Insert Into authors
   values('672-71-3249', 'Yokomoto', 'Akiko', '415 935-4228',
   '3 Silver Ct.', 'Walnut Creek', 'CA', '94595', 1);
Insert Into authors
   values('267-41-2394', 'O''Leary', 'Michael', '408 286-2428',
   '22 Cleveland Av. #14', 'San Jose', 'CA', '95128', 1);
Insert Into authors
   values('472-27-2349', 'Gringlesby', 'Burt', '707 938-6445',
   'PO Box 792', 'Covelo', 'CA', '95428', 3);
Insert Into authors
   values('527-72-3246', 'Greene', 'Morningstar', '615 297-2723',
   '22 Graybar House Rd.', 'Nashville', 'TN', '37215', 0);
Insert Into authors
   values('172-32-1176', 'White', 'Johnson', '408 496-7223',
   '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', 1);
Insert Into authors
   values('712-45-1867', 'del Castillo', 'Innes', '615 996-8275',
   '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', 1);
Insert Into authors
   values('846-92-7186', 'Hunter', 'Sheryl', '415 836-7128',
   '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1);
Insert Into authors
   values('486-29-1786', 'Locksley', 'Charlene', '415 585-4620',
   '18 Broadway Av.', 'San Francisco', 'CA', '94130', 1);
Insert Into authors
   values('648-92-1872', 'Blotchet-Halls', 'Reginald', '503 745-6402',
   '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', 1);
Insert Into authors
   values('341-22-1782', 'Smith', 'Meander', '913 843-0462',
   '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0);

insert into publishers values('0736', 'New Moon Books', 'Boston', 'MA', 'USA');   
insert into publishers values('0877', 'Binnet & Hardley', 'Washington', 'DC', 'USA');
insert into publishers values('1389', 'Algodata Infosystems', 'Berkeley', 'CA', 'USA');
insert into publishers values('1622', 'Five Lakes Publishing', 'Chicago', 'IL', 'USA');
insert into publishers values('1756', 'Ramona publishers', 'Dallas', 'TX', 'USA');
insert into publishers values('9952', 'Scootney Books', 'New York', 'NY', 'USA');
insert into publishers values('9901', 'GGG&G', 'Munchen', NULL, 'Germany');
insert into publishers values('9999', 'Lucerne Publishing', 'Paris', NULL, 'France');


SET datestyle TO MDY;

insert into titles values ('PC1035', 'But Is It User Friendly?', 'popular_comp', '1389',
22.95, 7000.00, 16, 8780,
'A survey of software for the naive user, focusing on the ''friendliness'' of each.',
'06/30/1991');

insert into titles values ('PC8888', 'Secrets of Silicon Valley', 'popular_comp', '1389',
20.00, 8000.00, 10, 4095,'Muckraking reporting on the world''s largest computer hardware and software manufacturers.',
'06/12/1994');

insert into titles values ('BU1032', 'The Busy Executive''s Database Guide', 'business',
'1389', 19.99, 5000.00, 10, 4095,
'An overview of available database systems with emphasis on common business applications. Illustrated.',
'06/12/1991');

insert into titles values ('PS7777', 'Emotional Security: A New Algorithm', 'psychology',
'0736', 7.99, 4000.00, 10, 3336,
'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.',
'06/12/1991');
insert into titles values ('PS3333', 'Prolonged Data Deprivation: Four Case Studies',
'psychology', '0736', 19.99, 2000.00, 10, 4072,
'What happens when the data runs dry?  Searching evaluations of information-shortage effects.',
'06/12/1991');

insert into titles values ('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets',
'business', '1389', 11.95, 5000.00, 10, 3876,
'Helpful hints on how to use your electronic resources to the best advantage.',
'06/09/1991');
insert into titles values ('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', '0877',
19.99, 0.00, 12, 2032,
'Favorite recipes for quick, easy, and elegant meals.',
'06/09/1991');
insert into titles values ('TC7777', 'Sushi, Anyone?', 'trad_cook', '0877', 14.99, 8000.00,
10, 4095,
'Detailed instructions on how to make authentic Japanese sushi in your spare time.',
'06/12/1991');
insert into titles values ('TC4203', 'Fifty Years in Buckingham Palace Kitchens', 'trad_cook',
'0877', 11.95, 4000.00, 14, 15096,
'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.',
'06/12/1991');


insert into titles values('BU2075', 'You Can Combat Computer Stress!', 'business', '0736',
2.99, 10125.00, 24, 18722,
'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.',
'06/30/1991');

insert into titles values('PS2091', 'Is Anger the Enemy?', 'psychology', '0736', 10.95,
2275.00, 12, 2045,
'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.',
'06/15/1991');

insert into titles values('PS2106', 'Life Without Fear', 'psychology', '0736', 7.00, 6000.00,
10, 111,
'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.',
'10/05/1991');

insert into titles values('MC3021', 'The Gourmet Microwave', 'mod_cook', '0877', 2.99,
15000.00, 24, 22246,
'Traditional French gourmet recipes adapted for modern microwave cooking.',
'06/18/1991');

insert into titles values('TC3218', 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean',
'trad_cook', '0877', 20.95, 7000.00, 10, 375,
'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.',
'10/21/1991');

insert into titles (title_id, title, pub_id) values('MC3026','The Psychology of Computer Cooking', '0877');

insert into titles values ('BU7832', 'Straight Talk About Computers', 'business', '1389',
19.99, 5000.00, 10, 4095,
'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.',
'06/22/1991');
insert into titles values('PS1372', 'Computer Phobic AND Non-Phobic Individuals: Behavior Variations',
'psychology', '0877', 21.59, 7000.00, 10, 375,
'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.',
'10/21/1991');
insert into titles (title_id, title, type, pub_id, notes) values('PC9999', 'Net Etiquette',
'popular_comp', '1389', 'A must-read for computer conferencing.');

Insert Into titleauthor values('409-56-7008', 'BU1032', 1, 60);

Insert Into titleauthor values('486-29-1786', 'PS7777', 1, 100);
Insert Into titleauthor values('486-29-1786', 'PC9999', 1, 100);
Insert Into titleauthor values('712-45-1867', 'MC2222', 1, 100);
Insert Into titleauthor values('172-32-1176', 'PS3333', 1, 100);
Insert Into titleauthor values('213-46-8915', 'BU1032', 2, 40);
Insert Into titleauthor values('238-95-7766', 'PC1035', 1, 100);
Insert Into titleauthor values('213-46-8915', 'BU2075', 1, 100);
Insert Into titleauthor values('998-72-3567', 'PS2091', 1, 50);
Insert Into titleauthor values('899-46-2035', 'PS2091', 2, 50);
Insert Into titleauthor values('998-72-3567', 'PS2106', 1, 100);
Insert Into titleauthor values('722-51-5454', 'MC3021', 1, 75);
Insert Into titleauthor values('899-46-2035', 'MC3021', 2, 25);
Insert Into titleauthor values('807-91-6654', 'TC3218', 1, 100);
Insert Into titleauthor values('274-80-9391', 'BU7832', 1, 100);
Insert Into titleauthor values('427-17-2319', 'PC8888', 1, 50);
Insert Into titleauthor values('846-92-7186', 'PC8888', 2, 50);
Insert Into titleauthor values('756-30-7391', 'PS1372', 1, 75);
Insert Into titleauthor values('724-80-9391', 'PS1372', 2, 25);
Insert Into titleauthor values('724-80-9391', 'BU1111', 1, 60);
Insert Into titleauthor values('267-41-2394', 'BU1111', 2, 40);
Insert Into titleauthor values('672-71-3249', 'TC7777', 1, 40);
Insert Into titleauthor values('267-41-2394', 'TC7777', 2, 30);
Insert Into titleauthor values('472-27-2349', 'TC7777', 3, 30);
Insert Into titleauthor values('648-92-1872', 'TC4203', 1, 100);

Insert Into stores values('7066','Barnum''s','567 Pasadena Ave.','Tustin','CA','92789');
Insert Into stores values('7067','News & Brews','577 First St.','Los Gatos','CA','96745');
Insert Into stores values('7131','Doc-U-Mat: Quality Laundry and Books',
      '24-A Avogadro Way','Remulade','WA','98014');
Insert Into stores values('8042','Bookbeat','679 Carson St.','Portland','OR','89076');
Insert Into stores values('6380','Eric the Read Books','788 Catamaugus Ave.',
      'Seattle','WA','98056');
Insert Into stores values('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019');

Insert into sales values('7067', 'D4482', '09/14/1994', 10, 'Net 60','PS2091');
Insert into sales values('7131', 'N914008', '09/14/1994', 20, 'Net 30','PS2091');
Insert into sales values('7131', 'N914014', '09/14/1994', 25, 'Net 30','MC3021');
Insert into sales values('8042', '423LL19922', '09/14/1994', 15, 'ON invoice','MC3021');
Insert into sales values('8042', '423LL19930', '09/14/1994', 10, 'ON invoice','BU1032');
Insert into sales values('6380', '722a', '09/13/1994', 3, 'Net 60','PS2091');
Insert into sales values('6380', '6871', '09/14/1994', 5, 'Net 60','BU1032');
Insert into sales values('8042','P723', '03/11/1993', 25, 'Net 30', 'BU1111');
Insert into sales values('7896','X999', '02/21/1993', 35, 'ON invoice', 'BU2075');
Insert into sales values('7896','QQ2299', '10/28/1993', 15, 'Net 60', 'BU7832');
Insert into sales values('7896','TQ456', '12/12/1993', 10, 'Net 60', 'MC2222');
Insert into sales values('8042','QA879.1', '5/22/1993', 30, 'Net 30', 'PC1035');
Insert into sales values('7066','A2976', '5/24/1993', 50, 'Net 30', 'PC8888');
Insert into sales values('7131','P3087a', '5/29/1993', 20, 'Net 60', 'PS1372');
Insert into sales values('7131','P3087a', '5/29/1993', 25, 'Net 60', 'PS2106');
Insert into sales values('7131','P3087a', '5/29/1993', 15, 'Net 60', 'PS3333');
Insert into sales values('7131','P3087a', '5/29/1993', 25, 'Net 60', 'PS7777');
Insert into sales values('7067','P2121', '6/15/1992', 40, 'Net 30', 'TC3218');
Insert into sales values('7067','P2121', '6/15/1992', 20, 'Net 30', 'TC4203');
Insert into sales values('7067','P2121', '6/15/1992', 20, 'Net 30', 'TC7777');

Insert Into roysched values('BU1032', 0, 5000, 10);
Insert Into roysched values('BU1032', 5001, 50000, 12);
Insert Into roysched values('PC1035', 0, 2000, 10);
Insert Into roysched values('PC1035', 2001, 3000, 12);
Insert Into roysched values('PC1035', 3001, 4000, 14);
Insert Into roysched values('PC1035', 4001, 10000, 16);
Insert Into roysched values('PC1035', 10001, 50000, 18);
Insert Into roysched values('BU2075', 0, 1000, 10);
Insert Into roysched values('BU2075', 1001, 3000, 12);
Insert Into roysched values('BU2075', 3001, 5000, 14);
Insert Into roysched values('BU2075', 5001, 7000, 16);
Insert Into roysched values('BU2075', 7001, 10000, 18);
Insert Into roysched values('BU2075', 10001, 12000, 20);
Insert Into roysched values('BU2075', 12001, 14000, 22);
Insert Into roysched values('BU2075', 14001, 50000, 24);
Insert Into roysched values('PS2091', 0, 1000, 10);
Insert Into roysched values('PS2091', 1001, 5000, 12);
Insert Into roysched values('PS2091', 5001, 10000, 14);
Insert Into roysched values('PS2091', 10001, 50000, 16);
Insert Into roysched values('PS2106', 0, 2000, 10);
Insert Into roysched values('PS2106', 2001, 5000, 12);
Insert Into roysched values('PS2106', 5001, 10000, 14);
Insert Into roysched values('PS2106', 10001, 50000, 16);
Insert Into roysched values('MC3021', 0, 1000, 10);
Insert Into roysched values('MC3021', 1001, 2000, 12);
Insert Into roysched values('MC3021', 2001, 4000, 14);
Insert Into roysched values('MC3021', 4001, 6000, 16);
Insert Into roysched values('MC3021', 6001, 8000, 18);
Insert Into roysched values('MC3021', 8001, 10000, 20);
Insert Into roysched values('MC3021', 10001, 12000, 22);
Insert Into roysched values('MC3021', 12001, 50000, 24);
Insert Into roysched values('TC3218', 0, 2000, 10);
Insert Into roysched values('TC3218', 2001, 4000, 12);
Insert Into roysched values('TC3218', 4001, 6000, 14);
Insert Into roysched values('TC3218', 6001, 8000, 16);
Insert Into roysched values('TC3218', 8001, 10000, 18);
Insert Into roysched values('TC3218', 10001, 12000, 20);
Insert Into roysched values('TC3218', 12001, 14000, 22);
Insert Into roysched values('TC3218', 14001, 50000, 24);
Insert Into roysched values('PC8888', 0, 5000, 10);
Insert Into roysched values('PC8888', 5001, 10000, 12);
Insert Into roysched values('PC8888', 10001, 15000, 14);
Insert Into roysched values('PC8888', 15001, 50000, 16);
Insert Into roysched values('PS7777', 0, 5000, 10);
Insert Into roysched values('PS7777', 5001, 50000, 12);
Insert Into roysched values('PS3333', 0, 5000, 10);
Insert Into roysched values('PS3333', 5001, 10000, 12);
Insert Into roysched values('PS3333', 10001, 15000, 14);
Insert Into roysched values('PS3333', 15001, 50000, 16);
Insert Into roysched values('BU1111', 0, 4000, 10);
Insert Into roysched values('BU1111', 4001, 8000, 12);
Insert Into roysched values('BU1111', 8001, 10000, 14);
Insert Into roysched values('BU1111', 12001, 16000, 16);
Insert Into roysched values('BU1111', 16001, 20000, 18);
Insert Into roysched values('BU1111', 20001, 24000, 20);
Insert Into roysched values('BU1111', 24001, 28000, 22);
Insert Into roysched values('BU1111', 28001, 50000, 24);
Insert Into roysched values('MC2222', 0, 2000, 10);
Insert Into roysched values('MC2222', 2001, 4000, 12);
Insert Into roysched values('MC2222', 4001, 8000, 14);
Insert Into roysched values('MC2222', 8001, 12000, 16);
Insert Into roysched values('MC2222', 12001, 20000, 18);
Insert Into roysched values('MC2222', 20001, 50000, 20);
Insert Into roysched values('TC7777', 0, 5000, 10);
Insert Into roysched values('TC7777', 5001, 15000, 12);
Insert Into roysched values('TC7777', 15001, 50000, 14);
Insert Into roysched values('TC4203', 0, 2000, 10);
Insert Into roysched values('TC4203', 2001, 8000, 12);
Insert Into roysched values('TC4203', 8001, 16000, 14);
Insert Into roysched values('TC4203', 16001, 24000, 16);
Insert Into roysched values('TC4203', 24001, 32000, 18);
Insert Into roysched values('TC4203', 32001, 40000, 20);
Insert Into roysched values('TC4203', 40001, 50000, 22);
Insert Into roysched values('BU7832', 0, 5000, 10);
Insert Into roysched values('BU7832', 5001, 10000, 12);
Insert Into roysched values('BU7832', 10001, 15000, 14);
Insert Into roysched values('BU7832', 15001, 20000, 16);
Insert Into roysched values('BU7832', 20001, 25000, 18);
Insert Into roysched values('BU7832', 25001, 30000, 20);
Insert Into roysched values('BU7832', 30001, 35000, 22);
Insert Into roysched values('BU7832', 35001, 50000, 24);
Insert Into roysched values('PS1372', 0, 10000, 10);
Insert Into roysched values('PS1372', 10001, 20000, 12);
Insert Into roysched values('PS1372', 20001, 30000, 14);
Insert Into roysched values('PS1372', 30001, 40000, 16);
Insert Into roysched values('PS1372', 40001, 50000, 18);

Insert Into discounts values('Initial Customer', NULL, NULL, NULL, 10.5);
Insert Into discounts values('Volume Discount', NULL, 100, 1000, 6.7);
Insert Into discounts values('Customer Discount', '8042', NULL, NULL, 5.0);

Insert Into jobs values (DEFAULT, 'New Hire - Job not specified', 10, 10);
Insert Into jobs values (DEFAULT, 'Chief Executive Officer', 200, 250);
Insert Into jobs values (DEFAULT, 'Business Operations Manager', 175, 225);
Insert Into jobs values (DEFAULT, 'Chief Financial Officier', 175, 250);
Insert Into jobs values (DEFAULT, 'Publisher', 150, 250);
Insert Into jobs values (DEFAULT, 'Managing Editor', 140, 225);
Insert Into jobs values (DEFAULT, 'Marketing Manager', 120, 200);
Insert Into jobs values (DEFAULT, 'Public Relations Manager', 100, 175);
Insert Into jobs values (DEFAULT, 'Acquisitions Manager', 75, 175);
Insert Into jobs values (DEFAULT, 'Productions Manager', 75, 165);
Insert Into jobs values (DEFAULT, 'Operations Manager', 75, 150);
Insert Into jobs values (DEFAULT, 'Editor', 25, 100);
Insert Into jobs values (DEFAULT, 'sales Representative', 25, 100);
Insert Into jobs values (DEFAULT, 'Designer', 25, 100);


Insert Into employee values ('PTC11962M', 'Philip', 'T', 'Cramer', 2, 215, '9952', '11/11/1989');
Insert Into employee values ('AMD15433F', 'Ann', 'M', 'Devon', 3, 200, '9952', '07/16/1991');
Insert Into employee values ('F-C16315M', 'Francisco', '', 'Chang', 4, 227, '9952', '11/03/1990');
Insert Into employee values ('LAL21447M', 'Laurence', 'A', 'Lebihan', 5, 175, '0736', '06/03/1990');
Insert Into employee values ('PXH22250M', 'Paul', 'X', 'Henriot', 5, 159, '0877', '08/19/1993');
Insert Into employee values ('SKO22412M', 'Sven', 'K', 'Ottlieb', 5, 150, '1389', '04/05/1991');
Insert Into employee values ('RBM23061F', 'Rita', 'B', 'Muller', 5, 198, '1622', '10/09/1993');
Insert Into employee values ('MJP25939M', 'Maria', 'J', 'Pontes', 5, 246, '1756', '03/01/1989');
Insert Into employee values ('JYL26161F', 'Janine', 'Y', 'Labrune', 5, 172, '9901', '05/26/1991');
Insert Into employee values ('CFH28514M', 'Carlos', 'F', 'Hernadez', 5, 211, '9999', '04/21/1989');
Insert Into employee values ('VPA30890F', 'Victoria', 'P', 'Ashworth', 6, 140, '0877', '09/13/1990');
Insert Into employee values ('L-B31947F', 'Lesley', '', 'Brown', 7, 120, '0877', '02/13/1991');
Insert Into employee values ('ARD36773F', 'Anabela', 'R', 'Domingues', 8, 100, '0877', '01/27/1993');
Insert Into employee values ('M-R38834F', 'Martine', '', 'Rance', 9, 75, '0877', '02/05/1992');
Insert Into employee values ('PHF38899M', 'Peter', 'H', 'Franken', 10, 75, '0877', '05/17/1992');
Insert Into employee values ('DBT39435M', 'Daniel', 'B', 'Tonini', 11, 75, '0877', '01/01/1990');
Insert Into employee values ('H-B39728F', 'Helen', '', 'Bennett', 12, 35, '0877', '09/21/1989');
Insert Into employee values ('PMA42628M', 'Paolo', 'M', 'Accorti', 13, 35, '0877', '08/27/1992');
Insert Into employee values ('ENL44273F', 'Elizabeth', 'N', 'Lincoln', 14, 35, '0877', '07/24/1990');
Insert Into employee values ('MGK44605M', 'Matti', 'G', 'Karttunen', 6, 220, '0736', '05/01/1994');
Insert Into employee values ('PDI47470M', 'Palle', 'D', 'Ibsen', 7, 195, '0736', '05/09/1993');
Insert Into employee values ('MMS49649F', 'Mary', 'M', 'Saveley', 8, 175, '0736', '06/29/1993');
Insert Into employee values ('GHT50241M', 'Gary', 'H', 'Thomas', 9, 170, '0736', '08/09/1988');
Insert Into employee values ('MFS52347M', 'Martin', 'F', 'Sommer', 10, 165, '0736', '04/13/1990');
Insert Into employee values ('R-M53550M', 'Roland', '', 'Mendel', 11, 150, '0736', '09/05/1991');
Insert Into employee values ('HAS54740M', 'Howard', 'A', 'Snyder', 12, 100, '0736', '11/19/1988');
Insert Into employee values ('TPO55093M', 'Timothy', 'P', 'O''Rourke', 13, 100, '0736', '06/19/1988');
Insert Into employee values ('KFJ64308F', 'Karin', 'F', 'Josephs', 14, 100, '0736', '10/17/1992');
Insert Into employee values ('DWR65030M', 'Diego', 'W', 'Roel', 6, 192, '1389', '12/16/1991');
Insert Into employee values ('M-L67958F', 'Maria', '', 'Larsson', 7, 135, '1389', '03/27/1992');
Insert Into employee values ('PSP68661F', 'Paula', 'S', 'Parente', 8, 125, '1389', '01/19/1994');
Insert Into employee values ('MAS70474F', 'Margaret', 'A', 'Smith', 9, 78, '1389', '09/29/1988');
Insert Into employee values ('A-C71970F', 'Aria', '', 'Cruz', 10, 87, '1389', '10/26/1991');
Insert Into employee values ('MAP77183M', 'Miguel', 'A', 'Paolino', 11, 112, '1389', '12/07/1992');
Insert Into employee values ('Y-L77953M', 'Yoshi', '', 'Latimer', 12, 32, '1389', '06/11/1989');
Insert Into employee values ('CGS88322F', 'Carine', 'G', 'Schmitt', 13, 64, '1389', '07/07/1992');
Insert Into employee values ('PSA89086M', 'Pedro', 'S', 'Afonso', 14, 89, '1389', '12/24/1990');
Insert Into employee values ('A-R89858F', 'Annette', '', 'Roulet', 6, 152, '9999', '02/21/1990');
Insert Into employee values ('HAN90777M', 'Helvetius', 'A', 'Nagy', 7, 120, '9999', '03/19/1993');
Insert Into employee values ('M-P91209M', 'Manuel', '', 'Pereira', 8, 101, '9999', '01/09/1989');
Insert Into employee values ('KJJ92907F', 'Karla', 'J', 'Jablonski', 9, 170, '9999', '03/11/1994');
Insert Into employee values ('POK93028M', 'Pirkko', 'O', 'Koskitalo', 10, 80, '9999', '11/29/1993');
Insert Into employee values ('PCM98509F', 'Patricia', 'C', 'McKenna', 11, 150, '9999', '08/01/1989');





