SMODS.Atlas({key = "HC_Faces", path = "ranktest2.png", px = 71, py = 95})
SMODS.Atlas({key = "LC_Faces", path = "ranktest.png", px = 71, py = 95})
SMODS.Atlas({key = "other_lc_ui", path = "other_lc_ui.png", px = 18, py = 18})
SMODS.Atlas({key = "other_hc_ui", path = "other_hc_ui.png", px = 18, py = 18})

Tag_Ranks = {
    'TAG_BAL_UN',
    'TAG_BAL_RA'
}

BaseRanks 

SMODS.Rank{
    prefix_config = {
        key = {mod = false}
    },
    key = 'TAG_BAL_UN', 
    card_key = 'TUN',
    pos = {x = 0},
    lc_atlas = 'LC_Faces',
    hc_atlas = 'HC_Faces',
    tag = "Uncommon Tag",
    tag_key = 'tag_uncommon',
    nominal = 0,
    face = false,
    next = {"TAG_BAL_UN"},
    strength_effect = { ignore = 1 },
    suit_map = {
        Test_Other = 0
    },
    loc_txt = {
        name = 'Uncommon Tag Card',
    },
    in_pool = function(self, args)
        if args.suit == 'Other' then
            return true
        end 
    end,
}

SMODS.Rank{
    prefix_config = {
        key = {mod = false}
    },
    key = 'TAG_BAL_RA',
    card_key = 'TRA',
    pos = {x = 1},
    lc_atlas = 'LC_Faces',
    hc_atlas = 'HC_Faces',
    tag = "Rare Tag",
    tag_key = 'tag_rare',
    nominal = 0,
    face = false,
    next = {"TAG_BAL_RA"},
    strength_effect = { ignore = 1 },
    suit_map = {
        Test_Other = 1
    },
    loc_txt = {
        name = 'Rare Tag Card',
    },
    in_pool = function(self, args)
        if args.suit == 'Other' then
            return true
        end 
    end
}

SMODS.Suit {
    prefix_config = {
        key = {mod = false}
    },
    key = 'Other',
    card_key = 'Other',
    hc_atlas = 'HC_Faces',
    lc_atlas = 'LC_Faces',
    hc_ui_atlas = 'other_hc_ui',
    lc_ui_atlas = 'other_lc_ui',
    loc_txt = {
        singular = 'Other',
        plural = 'Others',
    },
    hc_colour = HEX'808080',
    lc_colour = HEX'808080',
    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
    in_pool = function(self, args)
        for _, rank in ipairs(Tag_Ranks) do
            if args.rank == rank then
                return true
            end
        end
    end
}