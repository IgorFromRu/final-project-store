Создать базу
CREATE DATABASE store_db;
После первого запуска
INSERT INTO `role` (`id`, `name`) VALUES ('1', 'ROLE_USER'),('2', 'ROLE_ADMIN');
Для создания пользователя с правами Admin создать пользователя через интерфейс, после в БД ввести код ниже
INSERT INTO `user_roles` (`user_id`, `roles_id`) VALUES ('сюда ввести id созданного пользователя', '2');
