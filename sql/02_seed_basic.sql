USE strong_memory_db;

INSERT IGNORE INTO difficults (
	difficulty, 
    translation, 
    max_quantity_words, 
    increase_display_time_seconds, 
    increase_typing_time_seconds
) VALUES
('easy', 'fácil', 15, 5, 5), 
('normal', 'normal', 25, 3, 3), 
('hard', 'difícil', 40, 2, 2);

INSERT IGNORE INTO user_roles(role) VALUES 
('ROLE_PLAYER'),
('ROLE_ADMINISTRATOR');