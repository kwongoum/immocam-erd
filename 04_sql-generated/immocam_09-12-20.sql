CREATE TABLE Applies (
  Users_id    bigint(19) NOT NULL, 
  Realties_id bigint(19) NOT NULL, 
  PRIMARY KEY (Users_id, 
  Realties_id));
CREATE TABLE Countries (
  id               bigint(19) NOT NULL AUTO_INCREMENT, 
  code             varchar(20) NOT NULL UNIQUE, 
  phone_code       varchar(20) NOT NULL, 
  alpha2           varchar(20) NOT NULL, 
  alpha3           varchar(20) NOT NULL, 
  name_en          varchar(255) NOT NULL, 
  name_fr          varchar(255), 
  delete_integrity tinyint(3) NOT NULL, 
  created_at       datetime NOT NULL, 
  updated_at       datetime NULL, 
  PRIMARY KEY (id));
CREATE TABLE Groupes (
  id       bigint(19) NOT NULL AUTO_INCREMENT, 
  Roles_id bigint(19), 
  name_en  varchar(100) NOT NULL, 
  name_fr  varchar(100), 
  PRIMARY KEY (id));
CREATE TABLE Groupes_Users (
  Groupes_id bigint(19) NOT NULL, 
  Users_id   bigint(19) NOT NULL, 
  PRIMARY KEY (Groupes_id, 
  Users_id));
CREATE TABLE Languages (
  id          bigint(19) NOT NULL AUTO_INCREMENT, 
  code        varchar(255) NOT NULL, 
  description text, 
  created_at  datetime NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Media_Types (
  id          bigint(19) NOT NULL AUTO_INCREMENT, 
  name        varchar(255) NOT NULL, 
  description text NOT NULL, 
  created_at  datetime NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Medias (
  id               bigint(19) NOT NULL AUTO_INCREMENT, 
  Media_Types_id   bigint(19) NOT NULL, 
  Realties_id      bigint(19), 
  Users_id         bigint(19) NOT NULL, 
  name             varchar(255) NOT NULL, 
  link             varchar(255) NOT NULL, 
  type             varchar(255) NOT NULL, 
  `size`           int(10) NOT NULL, 
  delete_integrity tinyint(3) NOT NULL, 
  created_at       datetime NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Password_resets (
  email      timestamp NOT NULL, 
  token      varchar(255) NOT NULL, 
  created_at datetime NOT NULL);
CREATE TABLE Permissions (
  id      bigint(19) NOT NULL AUTO_INCREMENT, 
  name_en varchar(100) NOT NULL, 
  name_fr varchar(100), 
  PRIMARY KEY (id));
CREATE TABLE Permissions_Roles (
  Permissions_id bigint(19) NOT NULL, 
  Roles_id       bigint(19) NOT NULL, 
  PRIMARY KEY (Permissions_id, 
  Roles_id));
CREATE TABLE Realties (
  id                     bigint(19) NOT NULL AUTO_INCREMENT, 
  Realties_Categories_id bigint(19) NOT NULL, 
  Towns_id               bigint(19) NOT NULL, 
  Users_id               bigint(19) NOT NULL, 
  description            text, 
  price                  double, 
  quantity               int(10), 
  applies_numbers        int(10) NOT NULL, 
  type                   varchar(100) NOT NULL, 
  status                 tinyint(3) NOT NULL, 
  delete_integrity       tinyint(3) NOT NULL, 
  created_at             datetime NOT NULL, 
  update_at              datetime NULL, 
  PRIMARY KEY (id));
CREATE TABLE Realty_categories (
  id          bigint(19) NOT NULL AUTO_INCREMENT, 
  name        varchar(100) NOT NULL, 
  description text NOT NULL, 
  created_at  datetime NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Roles (
  id      bigint(19) NOT NULL AUTO_INCREMENT, 
  name_en varchar(100) NOT NULL, 
  name_fr varchar(100) 												, 
  PRIMARY KEY (id));
CREATE TABLE Roles_Users (
  Roles_id bigint(19) NOT NULL, 
  Users_id bigint(19) NOT NULL, 
  PRIMARY KEY (Roles_id, 
  Users_id));
CREATE TABLE Subscription_HIstories (
  id               bigint(19) NOT NULL AUTO_INCREMENT, 
  Users_id         bigint(19) NOT NULL, 
  Subscriptions_id bigint(19) NOT NULL, 
  start_date       datetime NOT NULL, 
  end_date         datetime NOT NULL, 
  created_at       datetime NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Subscriptions (
  id                  bigint(19) NOT NULL AUTO_INCREMENT, 
  name                varchar(100) NOT NULL, 
  weekly_price        double NOT NULL, 
  monthly_price       double NOT NULL, 
  three_monthly_price double NOT NULL, 
  yearly_price        double NOT NULL, 
  description         text, 
  created_at          datetime NULL, 
  PRIMARY KEY (id));
CREATE TABLE Subscriptions_Users (
  Subscriptions_id bigint(19) NOT NULL, 
  Users_id         bigint(19) NOT NULL, 
  end_date         date NOT NULL, 
  start_date       date NOT NULL, 
  status           tinyint(3) NOT NULL, 
  delete_integrity tinyint(3) NOT NULL, 
  created_at       datetime NOT NULL, 
  update_at        datetime NOT NULL, 
  PRIMARY KEY (Subscriptions_id, 
  Users_id));
CREATE TABLE Towns (
  id               bigint(19) NOT NULL AUTO_INCREMENT, 
  code             varchar(255) NOT NULL UNIQUE, 
  Countries_id     bigint(19) NOT NULL, 
  name             varchar(255) NOT NULL, 
  delete_integrity tinyint(3) NOT NULL comment '                ', 
  created_at       datetime NOT NULL, 
  updated_at       datetime NULL, 
  PRIMARY KEY (id));
CREATE TABLE Users (
  id                 bigint(19) NOT NULL AUTO_INCREMENT, 
  Languages_id       bigint(19) NOT NULL, 
  Countries_id       bigint(19), 
  username           varchar(255) NOT NULL UNIQUE, 
  email              varchar(255) NOT NULL UNIQUE, 
  phone              varchar(255) UNIQUE, 
  password           varchar(255) NOT NULL, 
  gender             varchar(1), 
  about              text, 
  adress             varchar(255), 
  first_name         varchar(255), 
  last_name          varchar(255), 
  birthday           date, 
  status             tinyint(3) NOT NULL, 
  delete_integrity   tinyint(3) NOT NULL, 
  confirmation_token varchar(100), 
  confirmed_at       datetime NULL, 
  created_at         datetime NOT NULL, 
  remember_token     varchar(100), 
  PRIMARY KEY (id));
ALTER TABLE Permissions_Roles ADD CONSTRAINT FKPermission814592 FOREIGN KEY (Permissions_id) REFERENCES Permissions (id);
ALTER TABLE Permissions_Roles ADD CONSTRAINT FKPermission546428 FOREIGN KEY (Roles_id) REFERENCES Roles (id);
ALTER TABLE Roles_Users ADD CONSTRAINT FKRoles_User42770 FOREIGN KEY (Roles_id) REFERENCES Roles (id);
ALTER TABLE Roles_Users ADD CONSTRAINT FKRoles_User46511 FOREIGN KEY (Users_id) REFERENCES Users (id);
ALTER TABLE Groupes_Users ADD CONSTRAINT FKGroupes_Us233131 FOREIGN KEY (Groupes_id) REFERENCES Groupes (id);
ALTER TABLE Groupes_Users ADD CONSTRAINT FKGroupes_Us760483 FOREIGN KEY (Users_id) REFERENCES Users (id);
ALTER TABLE Groupes ADD CONSTRAINT FKGroupes194862 FOREIGN KEY (Roles_id) REFERENCES Roles (id);
ALTER TABLE Subscriptions_Users ADD CONSTRAINT FKSubscripti239449 FOREIGN KEY (Subscriptions_id) REFERENCES Subscriptions (id);
ALTER TABLE Subscriptions_Users ADD CONSTRAINT FKSubscripti118114 FOREIGN KEY (Users_id) REFERENCES Users (id);
ALTER TABLE Subscription_HIstories ADD CONSTRAINT FKSubscripti163015 FOREIGN KEY (Subscriptions_id, Users_id) REFERENCES Subscriptions_Users (Subscriptions_id, Users_id);
ALTER TABLE Medias ADD CONSTRAINT FKMedias334699 FOREIGN KEY (Media_Types_id) REFERENCES Media_Types (id);
ALTER TABLE Realties ADD CONSTRAINT FKRealties593417 FOREIGN KEY (Realties_Categories_id) REFERENCES Realty_categories (id);
ALTER TABLE Medias ADD CONSTRAINT FKMedias735198 FOREIGN KEY (Realties_id) REFERENCES Realties (id);
ALTER TABLE Users ADD CONSTRAINT FKUsers712746 FOREIGN KEY (Languages_id) REFERENCES Languages (id);
ALTER TABLE Users ADD CONSTRAINT FKUsers995725 FOREIGN KEY (Countries_id) REFERENCES Countries (id);
ALTER TABLE Towns ADD CONSTRAINT FKTowns970213 FOREIGN KEY (Countries_id) REFERENCES Countries (id);
ALTER TABLE Realties ADD CONSTRAINT FKRealties701346 FOREIGN KEY (Towns_id) REFERENCES Towns (id);
ALTER TABLE Applies ADD CONSTRAINT FKApplies525617 FOREIGN KEY (Users_id) REFERENCES Users (id);
ALTER TABLE Applies ADD CONSTRAINT FKApplies651641 FOREIGN KEY (Realties_id) REFERENCES Realties (id);
ALTER TABLE Medias ADD CONSTRAINT FKMedias59133 FOREIGN KEY (Users_id) REFERENCES Users (id);

