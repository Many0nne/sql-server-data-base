Create DATABASE TeamBuilder;
GO

""" créer une trois tables, une pour les utilisateurs avec leur nom prénom et leur rôle """

Create Table Users
(
    [id] int primary key identity(1,1),
    [firstname] nvarchar(50) not null,
    [lastname] nvarchar(50) not null,
    [role] nvarchar(50) not null,
);

""" une pour les équipes avec leur nom, le projet sur lequel elles travaillent et l'id de l'utilisateur qui en est le chef """

Create Table Teams
(
    [id] int primary key identity(1,1),
    [name] nvarchar(50) not null,
    [project] nvarchar(50) not null,
    [user_id] int not null,
);

""" et une table de jointure pour les membres de l'équipe """

Create Table Teams_has_users
(
    [personne_id] int,
    [equipe_id] int,
    primary key ([personne_id], [equipe_id])
);


ALTER TABLE Teams ADD FOREIGN KEY (user_id) REFERENCES Users(id);
ALTER TABLE Teams_has_users ADD FOREIGN KEY (personne_id) REFERENCES Users(id);
ALTER TABLE Teams_has_users ADD FOREIGN KEY (equipe_id) REFERENCES Teams(id);



""" insérer des données dans les tables """

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

Insert into Teams_has_users (TeamId, UserId) values (1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9);

""" requête pour afficher les équipes avec leur chef et les membres de l'équipe """