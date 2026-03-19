USE strong_memory_db;

INSERT IGNORE INTO difficults (difficulty) VALUES
('easy'), 
('normal'), 
('hard');

INSERT IGNORE INTO user_roles(role) VALUES 
('ROLE_PLAYER'),
('ROLE_ADMINISTRATOR');