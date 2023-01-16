create table users(
users_id int primary key not null auto_increment,
name varchar(255),
status int
);

select * from users;

delimiter //
create procedure ubaci_podatke()
	begin
		insert into users values(null, "Sima", 7);
        insert into users(users_id, name, status) values(null, "Mika", 9);
        insert into users(name, status) values("Pera", 5);
	end //
delimiter ;

call ubaci_podatke;

create view listaj_podatke as select * from users;

select * from listaj_podatke;
