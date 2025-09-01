-- Fake Jokers Sprites Wins
SMODS.Joker { key = 'luigiwin',
	no_collection = true,
	atlas = 'luigi_sprites',
	in_pool = function(self) return false end,
	pos = { x = 0, y = 0 },
	rarity = 4}

-- Fake Jokers Sprites Losses
SMODS.Joker { key = 'luigiloss',
	no_collection = true,
	atlas = 'luigi_sprites',
	in_pool = function(self) return false end,
	pos = { x = 1, y = 0 },
	rarity = 4}