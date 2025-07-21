SuitDeck_Suits = {"Spades", "Hearts", "Clubs", "Diamonds", "Paddles", "Cats", "Ships", "Plus", "Bolts", "Four-Point", "Arrow", "Triangle", "Shield", "Twin Point", "X", "Six-Point", "Circle", "Square", "Moon", "Star"}

SMODS.Back {
    name = "SuitDeck",
    key = "SuitDeck",
    prefix_config = {
        key = {mod = false}
    },
    config = {}, 
    pos = {x = 0, y = 0},
    loc_txt = {
        name = "TestDeck",
        text = {
            "AAAAAAAAAAAAA"
        }
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
            local SD_Spades   = pseudorandom_element(SuitDeck_Suits, pseudoseed('SD_Spades'))   
            local SD_Hearts   = pseudorandom_element(SuitDeck_Suits, pseudoseed('SD_Hearts'))
            local SD_Clubs    = pseudorandom_element(SuitDeck_Suits, pseudoseed('SD_Clubs'))
            local SD_Diamonds = pseudorandom_element(SuitDeck_Suits, pseudoseed('SD_Diamonds'))
                for k, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Clubs' then
                        v:change_suit(SD_Clubs)
                    end
                    if v.base.suit == 'Diamonds' then
                        v:change_suit(SD_Diamonds)
                    end
                    if v.base.suit == 'Hearts' then
                        v:change_suit(SD_Hearts)
                    end
                    if v.base.suit == 'Spades' then
                        v:change_suit(SD_Spades)
                    end
                end
                return true
            end
        }))
    end,
}

SMODS.Suit {
    key = 'Paddles',
    card_key = 'Paddles',
    prefix_config = {
        key = {mod = false}
    },
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'AC9000',
    lc_colour = HEX'CCBB00',
    pos = { y = 19 },
    ui_pos = { x = 0, y = 3 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Cats',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Cats',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'0056B8',
    lc_colour = HEX'009CCC',
    pos = { y = 16 }, 
    ui_pos = { x = 1, y = 3 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Ships',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Ships',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'B88100',
    lc_colour = HEX'CC9C00',
    pos = { y = 17 }, 
    ui_pos = { x = 3, y = 3 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Plus',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Plus',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'0037B8',
    lc_colour = HEX'005BCC',
    pos = { y = 18 }, 
    ui_pos = { x = 2, y = 3 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}


SMODS.Suit {
    key = 'Bolts',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Bolts',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'7E52A1',
    lc_colour = HEX'9164AF',
    pos = { y = 4 },
    ui_pos = { x = 0, y = 0 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Four-Point',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Four-Point',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'308431',
    lc_colour = HEX'67AF69',
    pos = { y = 5 },
    ui_pos = { x = 1, y = 0 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Arrow',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Arrow',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'36244B',
    lc_colour = HEX'422C5B',
    pos = { y = 6 },
    ui_pos = { x = 2, y = 0 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Triangle',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Triangle',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'C8AC00',
    lc_colour = HEX'DBC900',
    pos = { y = 7 },
    ui_pos = { x = 3, y = 0 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Shield',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Shield',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'8F0505',
    lc_colour = HEX'C42D2D',
    pos = { y = 8 },
    ui_pos = { x = 0, y = 1 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Twin Point',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Twin Point',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'0B119B',
    lc_colour = HEX'2D47C6',
    pos = { y = 9 },
    ui_pos = { x = 1, y = 1 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'X',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'X',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'1F4359',
    lc_colour = HEX'347189',
    pos = { y = 10 },
    ui_pos = { x = 2, y = 1 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Six-Point',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Six-Point',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'1A4A3D',
    lc_colour = HEX'2B7C66',
    pos = { y = 11 },
    ui_pos = { x = 3, y = 1 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Circle',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Circle',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'3A3D23',
    lc_colour = HEX'61663B',
    pos = { y = 12 },
    ui_pos = { x = 0, y = 2 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Square',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Square',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'2F1B1B',
    lc_colour = HEX'663B3B',
    pos = { y = 13 },
    ui_pos = { x = 1, y = 2 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Moon',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Moon',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'424554',
    lc_colour = HEX'5D6076',
    pos = { y = 14 },
    ui_pos = { x = 2, y = 2 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}

SMODS.Suit {
    key = 'Star',
    prefix_config = {
        key = {mod = false}
    },
    card_key = 'Star',
    hc_atlas = 'cards_HC',
    lc_atlas = 'cards_LC',
    hc_ui_atlas = 'ui_HC',
    lc_ui_atlas = 'ui_LC',
    hc_colour = HEX'CE256B',
    lc_colour = HEX'DF509F',
    pos = { y = 15 },
    ui_pos = { x = 3, y = 2 },
    in_pool = function(self, args)
        if G.GAME.selected_back and (G.GAME.selected_back.effect.center.key == "b_SuitDeck") then             
            if args.initial_deck then return false else return true end
        else
            return false
        end
    end
}