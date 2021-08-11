Настройка базы песле создания.

INSERT INTO t_role(id, name)
  VALUES (1, 'ROLE_USER'), (2, 'ROLE_ADMIN');

INSERT INTO t_user_roles(user_id, roles_id)
  VALUES (1, 2);
  
INSERT INTO t_product(id, name, price) 
VALUES (1, 'Кухня 1', 150000), (2, 'Кухня 2', 200000), (3, 'Шкаф-купэ', 15000);