create table Movie(mID integer primary key autoincrement,
                   title text,
                   year integer,
                   director text);

create table Reviewer(rID integer primary key autoincrement,
                      name text);

create table Rating(rID integer,
                    mID integer,
                    stars integer,
                    ratingDate text,
                    foreign key (rID) references Reviewer (rID),
                    foreign key (mID) references Movie (mID),
                    unique (rID, mID, ratingDate));

insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming'),
                        (102, 'Star Wars', 1977, 'George Lucas'),
                        (103, 'The Sound of Music', 1965, 'Robert Wise'),
                        (104, 'E.T.', 1982, 'Steven Spielberg'),
                        (105, 'Titanic', 1997, 'James Cameron'),
                        (106, 'Snow White', 1937, null),
                        (107, 'Avatar', 2009, 'James Cameron'),
                        (108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez'),
                           (202, 'Daniel Lewis'),
                           (203, 'Brittany Harris'),
                           (204, 'Mike Anderson'),
                           (205, 'Chris Jackson'),
                           (206, 'Elizabeth Thomas'),
                           (207, 'James Cameron'),
                           (208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22'),
                         (201, 101, 4, '2011-01-27'),
                         (202, 106, 4, null),
                         (203, 103, 2, '2011-01-20'),
                         (203, 108, 4, '2011-01-12'),
                         (203, 108, 2, '2011-01-30'),
                         (204, 101, 3, '2011-01-09'),
                         (205, 103, 3, '2011-01-27'),
                         (205, 104, 2, '2011-01-22'),
                         (205, 108, 4, null),
                         (206, 107, 3, '2011-01-15'),
                         (206, 106, 5, '2011-01-19'),
                         (207, 107, 5, '2011-01-20'),
                         (208, 104, 3, '2011-01-02');

delete from Rating where stars <= 2;
update Rating set stars = 4 where stars = 3;
insert into Reviewer values(210, 'Oleg');
insert into Reviewer (name) values('Arkadiy');
