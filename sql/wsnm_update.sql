/*
Script for updating WSNM spawn points and initial balancing (hp/levels) on an existing DSP database
Usage: mysql dspdb -u darkstar < wsnm_update.sql
*/

-- Mob spawn points
-- Note: Using DSP defaults for Greenman, Kettenkaefer, and Cailleach Bheur.
--       Stolas is a best guess since no retail data is available.
--       More info at https://github.com/ababyduck/darkstar-ahiru/projects/1
UPDATE `mob_spawn_points` SET pos_x = 29,		pos_y = 16,		pos_z = -140,	pos_rot = 127	WHERE mobname = 'Bodach';
UPDATE `mob_spawn_points` SET pos_x = 56,		pos_y = -1,		pos_z = 16,		pos_rot = 206	WHERE mobname = 'Baronial Bat';
UPDATE `mob_spawn_points` SET pos_x = -141.6,	pos_y = -2,		pos_z = 450.48,	pos_rot = 99	WHERE mobname = 'Girtablulu';
UPDATE `mob_spawn_points` SET pos_x = -652.3,	pos_y = 0.2,	pos_z = -341.5,	pos_rot = 141	WHERE mobname = 'Maharaja';
UPDATE `mob_spawn_points` SET pos_x = 220,		pos_y = -8.11,	pos_z = 205.38,	pos_rot = 191	WHERE mobname = 'Yallery_Brown';
UPDATE `mob_spawn_points` SET pos_x = 200.3,	pos_y = -11,	pos_z = -24.8,	pos_rot = 105	WHERE mobname = 'Mokumokuren';
UPDATE `mob_spawn_points` SET pos_x = 112.5,	pos_y = 0.8,	pos_z = -126.2,	pos_rot = 158	WHERE mobname = 'Water_Leaper';
UPDATE `mob_spawn_points` SET pos_x = 115,		pos_y = 14.68,	pos_z = 164.1,	pos_rot = 92	WHERE mobname = 'Megapod_Megalops';
UPDATE `mob_spawn_points` SET pos_x = 200.3,	pos_y = -11,	pos_z = -24.8,	pos_rot = 105	WHERE mobname = 'Eldhrimnir';
UPDATE `mob_spawn_points` SET pos_x = -151.65,	pos_y = -8.5,	pos_z = 191.37,	pos_rot = 166	WHERE mobname = 'Stolas';
UPDATE `mob_spawn_points` SET pos_x = -18,		pos_y = -19.2,	pos_z = -176.4,	pos_rot = 0		WHERE mobname = 'Beet_Leafhopper';

-- Mob levels and HP
-- Note: Verified against ffxiclopedia. When either level or HP were not available, defaulted to Lv80/9000 HP
--       More info at https://github.com/ababyduck/darkstar-ahiru/projects/2
UPDATE `mob_groups` SET HP = 7500,	minlevel = 80, maxlevel = 80 WHERE groupid = 8773;	-- Bodach
UPDATE `mob_groups` SET HP = 10500,	minlevel = 82, maxlevel = 82 WHERE groupid = 10106;	-- Baronial Bat
UPDATE `mob_groups` SET HP = 10000,	minlevel = 80, maxlevel = 80 WHERE groupid = 10077;	-- Girtablulu
UPDATE `mob_groups` SET HP = 9000,	minlevel = 80, maxlevel = 80 WHERE groupid = 6788;	-- Maharaja
UPDATE `mob_groups` SET HP = 7200,	minlevel = 80, maxlevel = 80 WHERE groupid = 8450;	-- Yallery Brown
UPDATE `mob_groups` SET HP = 9000,	minlevel = 80, maxlevel = 81 WHERE groupid = 6608;	-- Greenman
UPDATE `mob_groups` SET HP = 9000,	minlevel = 80, maxlevel = 82 WHERE groupid = 8467;	-- Mokumokuren
UPDATE `mob_groups` SET HP = 10000,	minlevel = 80, maxlevel = 80 WHERE groupid = 9242;	-- Water Leaper
UPDATE `mob_groups` SET HP = 9800,	minlevel = 80, maxlevel = 80 WHERE groupid = 10159;	-- Megapod Megalops
UPDATE `mob_groups` SET HP = 10500,	minlevel = 80, maxlevel = 80 WHERE groupid = 9038;	-- Kettenkaefer
UPDATE `mob_groups` SET HP = 9600,	minlevel = 80, maxlevel = 80 WHERE groupid = 6641;	-- Eldhrimnir
UPDATE `mob_groups` SET HP = 9300,	minlevel = 82, maxlevel = 82 WHERE groupid = 9968;	-- Cailleach Bheur
UPDATE `mob_groups` SET HP = 8500,	minlevel = 80, maxlevel = 80 WHERE groupid = 6241;	-- Stolas
UPDATE `mob_groups` SET HP = 11000,	minlevel = 75, maxlevel = 75 WHERE groupid = 8142;	-- Beet Leafhopper