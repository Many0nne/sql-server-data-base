Create DATABASE TeamBuilder;
GO

""" créer une trois tables, une pour les utilisateurs avec leur nom prénom et leur rôle """

Create Table Users
(
    Id int primary key identity(1,1),
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Role nvarchar(50) not null
);

""" une pour les équipes avec leur nom, le projet sur lequel elles travaillent et l'id de l'utilisateur qui en est le chef """

Create Table Teams
(
    Id int primary key identity(1,1),
    Name nvarchar(50) not null,
    Project nvarchar(50) not null,
    UserId int not null,
    constraint FK_Users foreign key (UserId) references Users(Id)
);

Insert into Users (FirstName, LastName, Role) values ('John', 'Doe', 'Chef'),
('Jane', 'Doe', 'Designer'),
('Jack', 'Doe', 'Designer'),
('Jill', 'Doe', 'Chef'),
('James', 'Doe', 'Designer'),
('Judy', 'Doe', 'Designer'),
('Jules', 'Doe', 'Chef'),
('Jasmine', 'Doe', 'Designer'),
('Jasper', 'Doe', 'Designer');

Insert into Teams (Name, Project, UserId) values ('Team A', 'Projet site internet mairie', 1),
('Team A', 'Projet site internet mairie', 2),
('Team A', 'Projet site internet mairie', 3),
('Team B', 'Projet CRM', 4),
('Team B', 'Projet CRM', 5),
('Team B', 'Projet CRM', 6),
('Team C', 'Projet ERP', 7),
('Team C', 'Projet ERP', 8),
('Team C', 'Projet ERP', 9);