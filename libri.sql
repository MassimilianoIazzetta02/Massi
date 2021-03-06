.mode column
.header on

drop table if exists autori;
create table autori (
    id integer primary key,
    nome text,
    cognome text not null
);

insert into autori (nome, cognome) values ('stephen', 'king');
insert into autori (cognome) values ('Rowling');
insert into autori (cognome) values ('Freud');
insert into autori (cognome) values ('Autore2');
insert into autori (cognome) values ('Autore3');

select * from autori;
select '';


drop table if exists libri;
create table libri (
    id integer primary key,
    titolo text not null
);

insert into libri (titolo) values ('It');
insert into libri (titolo) values ('Harry Potter');
insert into libri (titolo) values ("L'interpretazione dei sogni");
insert into libri (titolo) values ('Test senza autori');

select * from libri;
select '';

drop table if exists autori_libri;
create table autori_libri (
    id integer primary key not null,
    id_autore integer not null,
    id_libro integer not null
);

insert into autori_libri (id_autore, id_libro) values (1, 1);
insert into autori_libri (id_autore, id_libro) values (2, 2);
insert into autori_libri (id_autore, id_libro) values (5, 3);
insert into autori_libri (id_autore, id_libro) values (3, 3);
insert into autori_libri (id_autore, id_libro) values (4, 3);


select libri.titolo, group_concat(autori.cognome) as autori from libri
    left join autori_libri on libri.id=autori_libri.id_libro
    left join autori on autori.id=autori_libri.id_autore
where libri.id = 3
group by libri.id;
select '';


SELECT libri.id, libri.titolo, group_concat(autori.cognome) as autori FROM libri
    LEFT JOIN autori_libri ON libri.id=autori_libri.id_libro
    LEFT JOIN autori ON autori_libri.id_autore=autori.id
GROUP BY libri.id
ORDER BY libri.titolo;
select '';