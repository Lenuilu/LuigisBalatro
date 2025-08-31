local atlas_key = 'LPB'
local atlas_path = 'LuigisBalatro_LC.png' -- Filename for the image in the asset folder
local atlas_path_hc = 'LuigisBalatro_HC.png' -- Filename for the high-contrast version of the texture, if existing

local suits = {'hearts','spades','clubs','diamonds'} -- Which suits to replace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",} -- Which ranks to replace

local description = 'Luigi\'s Balatro' -- English-language description, also used as default

SMODS.Atlas { key = 'modicon', px = 32, py = 32, path = 'modicon.png' }

-- Config
LPB_config = SMODS.current_mod.config

-- UI
local UI, load_error = SMODS.load_file("ui.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  UI()
end

-- Jokers
SMODS.Atlas{  
        key = 'luigi_sprites',
        px = 71,
        py = 95,
        path = "luigi_sprites.png",
    }
-- assert(SMODS.load_file("jokers.lua"))() -- Testing
SMODS.load_file("jokers.lua")()

-- Quips
if LPB_config.luigiquips then
    SMODS.load_file("quips.lua")()
else
end

-- UI Suits
if LPB_config.luigicustomsuits then
	SMODS.Atlas{
		key = 'ui_1',
		px = 18,
		py = 18,
		path = "ui_assets.png",
		prefix_config = {key = false},
	}
	SMODS.Atlas{
		key = 'ui_2',
		px = 18,
		py = 18,
		path = "ui_assets_opt2.png",
		prefix_config = {key = false},
	}
else
end


-- Deck
SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

-- Malverk
if LPB_config.luigicbase then
LUIGIENHANCERPATH = 'EnhancersLuigi.png'
else
LUIGIENHANCERPATH = 'EnhancersLuigi_White.png'
end

AltTexture({
    key = 'luigi-backs',
    set = 'Back',
    keys = {'b_red','b_blue','b_yellow','b_green','b_black','b_nebula','b_abandoned','b_checkered','b_erratic',},
    -- display_pos = 'm_stone',
    path = LUIGIENHANCERPATH,
	loc_txt = { name = 'Luigi Backs',},
    original_sheet = true
})

if LPB_config.luigiquips then -- cbase on
AltTexture({
    key = 'luigi-enhanced',
    set = 'Enhanced',
    path = LUIGIENHANCERPATH,
	loc_txt = { name = 'Luigi Enhancers',},
    keys = {'m_bonus','m_mult','m_wild','m_glass','m_steel','m_stone','m_gold','c_base'},
    original_sheet = true
})
else
AltTexture({
    key = 'luigi-enhanced',
    set = 'Enhanced',
    path = LUIGIENHANCERPATH,
	loc_txt = { name = 'Luigi Enhancers',},
    keys = {'m_bonus','m_mult','m_wild','m_glass','m_steel','m_stone','m_gold'},
    original_sheet = true
})
end

AltTexture({
    key = 'luigi-seal',
    set = 'Seal',
	loc_txt = { name = 'Luigi Seals',},
    path = LUIGIENHANCERPATH,
})

TexturePack {
    key = 'cards',
    textures = {
        "LPB_luigi-backs", "LPB_luigi-enhanced", "LPB_luigi-seal",
    },
        loc_txt = {
        name = "Luigi's Balatro",
        text = {
            "Changes the cards into",
            "a Luigi's Casino style."
        }
    }
}