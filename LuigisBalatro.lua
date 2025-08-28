local atlas_key = 'LPB'
local atlas_path = 'LuigisBalatro.png' -- Filename for the image in the asset folder
local atlas_path_hc = nil -- Filename for the high-contrast version of the texture, if existing

local suits = {'hearts','spades','clubs','diamonds'} -- Which suits to replace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",} -- Which ranks to replace

local description = 'Luigi\'s Balatro' -- English-language description, also used as default

SMODS.Atlas { key = 'modicon', px = 32, py = 32, path = 'modicon.png' }

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

AltTexture({
    key = 'luigi-backs',
    set = 'Back',
    keys = {'b_red','b_blue','b_yellow','b_green','b_black','b_nebula','b_abandoned','b_checkered','b_erratic',},
    -- display_pos = 'm_stone',
    path = 'EnhancersLuigi.png',
    original_sheet = true
})

AltTexture({
    key = 'luigi-enhanced',
    set = 'Enhanced',
    path = 'EnhancersLuigi.png',
    keys = {'m_bonus','m_mult','m_wild','m_glass','m_steel','m_stone','m_gold','c_base'},
    original_sheet = true
})

AltTexture({
    key = 'luigi-seal',
    set = 'Seal',
    path = 'EnhancersLuigi.png',
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