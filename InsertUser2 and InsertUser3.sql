select * from users;

delimiter //
	create procedure insertUser(name1 varchar(255), status1 int)
		begin	
			insert into users(name, status) values(name1, status1);
		end //
delimiter ;

call insertUser("Isidora", 2);

select * from listaj_podatke;

delimiter //
create procedure insertUser2(name1 varchar(255), status1 int)
	begin
		declare userCount int;
        select count(*) from users where name = name1 into userCount;
        select userCount;
        if userCount < 1 then
			insert into users(name, status) values(name1, status1);
            select 0;
		else 
			select -1;
		end if;
	end //
delimiter ;

call insertUser2("Predrag", 3);

delimiter //
create procedure insertUser3(name1 varchar(255), status1 int, password1 varchar(255))
	begin
		declare userCount int;
        select count(*) from users where name = name1 into userCount;
        if userCount < 1 then
			insert into users(name, status, password) values(name1, status1, password1);
            select * from listaj_podatke;
		else
			update users set status = status1, password = password1 where name = name1;
            select * from listaj_podatke;
		end if;
	end //
delimiter ;

call insertUser3("Marko", 2, "456");
call insertUser3("Predrag", 12, "799");