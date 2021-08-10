Настройка базы песле создания.

INSERT INTO t_role(id, name)
  VALUES (1, 'ROLE_USER'), (2, 'ROLE_ADMIN');

INSERT INTO t_user_roles(user_id, roles_id)
  VALUES (1, 2);