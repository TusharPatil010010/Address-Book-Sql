#UC1:
create database AddressBookService;
show databases;
use AddressBookService;

#UC2:
create table addressBookTable
    -> (
    -> firstname    varchar(150) NOT NULL,
    -> lastname    varchar(150) NOT NULL,
    -> address  varchar(300) NOT NULL,
    -> city     varchar(150) NOT NULL,
    -> state    varchar(150) NOT NULL,
    -> zip      numeric(6)  NOT NULL,
    -> phone    numeric(10) NOT NULL,
    -> email    varchar(200) NOT NULL,
    -> PRIMARY KEY(firstname,lastname)
    -> );
 describe addressBookTable;

#UC3:
insert into addressBookTable (firstname, lastname, address, city, state, zip, phone, email) values
('Ratan','Tata','ichalkaranji','kolhapur','Maharashtra', 416115, 9876543210,'ratan@gmail.com'),
('Mukesh','Ambani','ichalkaranji','kolhapur','Maharashtra', 416115, 9874563210,'mukesh@gmail.com'),
('Mark','Zukerberg','ichalkaranji','kolhapur','Maharashtra', 416115, 9874561230,'mark@gmail.com'),
('Tushar','Patil','ichalkaranji','kolhapur','Maharashtra', 416115, 9876541230,'tushar@gmail.com');
select * from addressBookTable;

#UC4:
update addressBookTable set phone = 9874123650 where firstname = 'Ratan' AND lastname = 'Tata';
update addressBookTable set email = 'mukeshambani@gmail.com' where firstname = 'Mukesh' AND lastname = 'Ambani';
select * from addressBookTable;

#UC5:
delete from addressBookTable where firstname = 'Mark' AND lastname = 'Zukerberg';
select * from addressBookTable;

#UC6:
update addressBookTable set city = 'Mumbai',zip = '400019' where firstname = 'Mukesh' AND lastname = 'Ambani';
update addressBookTable set city = 'Banglore',zip = '400115' where firstname = 'Ratan' AND lastname = 'Tata';
insert into addressBookTable values('Jeff','Bezos','ichalkaranji','kolhapur','Maharashtra',416115,9874521036,'jeff@gmail.com');
select * from addressBookTable where city = 'ichalkaranji';
select * from addressBookTable where city = 'Pune';
select * from addressBookTable where state = 'Maharashtra';

#UC7
select city, state, count(*) from addressBookTable group by city, state;

#UC8
select * from addressBookTable where city = 'ichalkaranji' order by firstname,lastname;

#UC9
alter table addressBookTable add id INT AUTO_INCREMENT NOT NULL primary key  first;
alter table addressBookTable change id contact_id INT;
alter table addressBookTable rename contact_table;
create table addressBook
    -> (
    -> id       INT NOT NULL AUTO_INCREMENT,
    -> addName  VARCHAR(150) NOT NULL,
    -> type     VARCHAR(150),
    -> primary key (id)
    -> );
alter table addressBook add contacts_id INT NOT NULL after id;
alter table addressBook add foreign key (contacts_id) references contact_table(contact_id);

#UC10
 select type,count(contacts_id) from addressBook group by type;

 #UC11
insert into addressBook (contacts_id, addName, type) values (1,'AddressBook1','family');
insert into addressBook (contacts_id, addName, type) values (2,'AddressBook2','friend');
insert into addressBook (contacts_id, addName, type) values (3,'AddressBook3','profession');
insert into addressBook (contacts_id, addName, type) values (1,'AddressBook2','friend');

#UC13
select contact_table.contact_id, contact_table.firstname,contact_table.lastname,contact_table.address, contact_table.city, contact_table.state, 
       contact_table.zip, contact_table.phone, contact_table.email, addressBook.addName, addressBook.type
from contact_table inner join addressBook on contact_table.contact_id = addressBook.contacts_id;