INSERT INTO users (user_id, username, email, password, first_name, last_name, age, gender, created_at, updated_at, user_role)
VALUES (1, 'exampleUser', 'example@user.com', 'examplePassword', 'Example', 'User', 25, 'M', GETDATE(), GETDATE(), 'admin');
