--- STEAMODDED HEADER
--- MOD_NAME: Luigi's Picture Balatro
--- MOD_ID: LuigisPictureBalatro
--- PREFIX: LPB
--- MOD_AUTHOR: [Lenuilu]
--- MOD_DESCRIPTION: Balatro but Luigi has taken over Jimbo's domain! (Special thanks to Marie(maratby), marziks, and Fytos on the Balatro Discord Server for giving me ideas for the ranks and suits!)
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0.0
--- BADGE_COLOR: 81B622

local atlas_key = 'LPB' -- Format: PREFIX_KEY
-- See end of file for notes
local atlas_path = 'LuigisBalatro.png' -- Filename for the image in the asset folder
local atlas_path_hc = nil -- Filename for the high-contrast version of the texture, if existing

local suits = {'hearts','spades','clubs','diamonds'} -- Which suits to replace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",} -- Which ranks to replace

local description = 'Luigi\'s Balatro' -- English-language description, also used as default

-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

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

-- Notes:

-- The current version of Steamodded has a bug with prefixes in mods including `DeckSkin`s.
-- By manually including the prefix in the atlas' key, this should keep the mod functional
-- even after this bug is fixed.
