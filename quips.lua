-- Character = Key
LuigiWin = 'j_LPB_luigiwin'
LuigiLoss = 'j_LPB_luigiloss'

-- Wins
SMODS.JimboQuip{ key = 'luigiwin',
    type = 'win',
	extra = { center = LuigiWin, particle_colours = { HEX("81B622"), HEX("009c00"), HEX("365586") }, materialize_colours = { HEX("81B622"), HEX("009c00"), HEX("365586")} }, sound = 'voice11'}


-- Losses
SMODS.JimboQuip{ key = 'luigiloss',
    type = 'loss',
	extra = { center = LuigiLoss, particle_colours = { HEX("81B622"), HEX("009c00"), HEX("365586") }, materialize_colours = { HEX("81B622"), HEX("009c00"), HEX("365586")} }, sound = 'voice11'}
