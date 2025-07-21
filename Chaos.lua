SMODS.load_file('src/suits.lua')()



SMODS.Atlas {key = "cards_HC", path = "cards_opt2.png", px = 71, py = 95}
SMODS.Atlas {key = "cards_LC", path = "cards.png", px = 71, py = 95}
SMODS.Atlas {key = "ui_HC", path = "ui_assets_opt2.png", px = 18, py = 18}
SMODS.Atlas {key = "ui_LC", path = "ui_assets.png", px = 18, py = 18}

SMODS.Atlas {key = 'BChaosU_Jokers', path = 'Joker.png', px = 71, py = 95}
SMODS.Atlas {key = 'BChaosU_centers', path = 'Enhancers.png', px = 71, py = 95}
SMODS.Atlas {key = 'BChaosU_Tarot', path = 'Tarots.png', px = 71, py = 95}

-- Rarities --

SMODS.Rarity{
    key = "ultra",
    prefix_config = {
        key = {mod = false}
    },
    badge_colour = G.C.FILTER,
	default_weight = 0.01,
	pools = { ["Joker"] = true },
}

SMODS.Rarity{
    key = "impossible",
    prefix_config = {
        key = {mod = false}
    },
    badge_colour = G.C.BLACK,
	default_weight = 0.0001,
	pools = { ["Joker"] = true },
}


-- Jokers --

SMODS.Joker{
    key = "toker",
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 2, y = 0 },
    rarity = 2,
    cost = 6, 
    order = 0,
    config = { extra = { odds = 20, chips = 420 }, },
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal * 4) or 4, card.ability.extra.odds, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if pseudoseed('toker') < (G.GAME.probabilities.normal * 4) / card.ability.extra.odds then
                return {
                chips = card.ability.extra.chips
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'Chaotic_Joker',
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 0, y = 0 },
    rarity = "ultra",
    cost = 10,
    config = { extra = { mult = 4 }, },
    order = 100,
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{
    key = "bootleg",
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 1, y = 0 },
    rarity = "ultra",
    cost = 10,
    order = 101,
    config = { extra = {chips = 77, mult = 7, xmult = 1.77, xchips = 1.77, echips = 1.07, emult = 1.07, dollars = 7}, },
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.echips, card.ability.extra.emult, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        local rand = pseudorandom("bootleg", 1, 7)
        if context.joker_main then
            if rand == 1 then
                return {
                    chips = card.ability.extra.chips,
                }
            elseif rand == 2 then
                return {
                    mult = card.ability.extra.mult,
                }
            elseif rand == 3 then
                return {
                    xmult = card.ability.extra.xmult,
                }
            elseif rand == 4 then
                return {
                    xchips = card.ability.extra.xchips,
                }
            elseif rand == 5 then
                return {
                    echips = card.ability.extra.echips,
                }
            elseif rand == 6 then
                return {
                    emult = card.ability.extra.emult,
                }
            elseif rand == 7 then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'Murphy',
    rarity = 3,
    cost = 8,
    prefix_config = {
        key = {mod = false}
    },
    order = 102,
    blueprint_compat = true,
    pos = { x = 3, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = { extra = { money = 18405, aceodds = 5, moneyodds = 1000 } }, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.money, (G.GAME.probabilities.normal or 1), card.ability.extra.aceodds, card.ability.extra.moneyodds} }
    end,
    calculate = function(self, card, context)
        local MurphyCardA = { set = "Enhanced", area = G.hand, enhancement = "m_glass", seal = "Red"}
        local MurphyCardB = { set = "Enhanced", area = G.hand, enhancement = "m_blank"}
        local MurphyMoney = pseudorandom(pseudoseed('MurphyMoney'))
        local MurphyEnhance = pseudorandom(pseudoseed('MurphyEnhance'))
    
        if context.first_hand_drawn and not context.repetition and not context.individual then
            if MurphyEnhance > (1 - ((G.GAME.probabilities.normal or 1) / card.ability.extra.aceodds)) then
            local MurphyCardCardA = SMODS.create_card(MurphyCardA)
                SMODS.change_base(MurphyCardCardA, 'Hearts', 'King')
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, MurphyCardCardA)
                G.hand:emplace(MurphyCardCardA) 
                MurphyCardCardA:start_materialize()
            else
                for i = 1, 2 do
                    local MurphyCardCardB = SMODS.create_card(MurphyCardB)
                    SMODS.change_base(MurphyCardCardB, 'Hearts', 'King')
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, MurphyCardCardB)
                    G.hand:emplace(MurphyCardCardB) 
                    MurphyCardCardB:start_materialize()
                end
            end
        end
    
        if context.end_of_round and not context.repetition and not context.individual then
            if MurphyMoney > (1 - ((G.GAME.probabilities.normal or 1) / card.ability.extra.moneyodds)) then
                ease_dollars(card.ability.extra.money)
            end
        end
    end
}

SMODS.Joker{
    key = 'Roffle',
    prefix_config = {
        key = {mod = false}
    },
    rarity = 3,
    cost = 8,
    order = 105,
    blueprint_compat = true,
    pos = { x = 4, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = {x_mult = 1, extra = { campfire = 0.25, PerkeoOdds = 4, } }, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.campfire, (G.GAME.probabilities.normal or 1), card.ability.extra.PerkeoOdds, card.ability.x_mult} }

    end,
    calculate = function(self, card, context)
        local RoffleEnhance = pseudorandom(pseudoseed('RoffleEnhance'))
    
        if context.selling_card and not context.blueprint and not context.repetition and not context.individual then
                card.ability.x_mult = card.ability.x_mult + card.ability.extra.campfire
                G.E_MANAGER:add_event(Event({
                    func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')}); return true
                    end
                }))
        end
    
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            if G.GAME.blind.boss and card.ability.x_mult > 1 then
                card.ability.x_mult = card.ability.x_mult / 2
                if card.ability.x_mult < 1 then
                    card.ability.x_mult = 1
                end
                return {
                    message = 'Halved',
                    colour = G.C.RED
                }
            end
        end

        if context.ending_shop then
            if RoffleEnhance > (1 - ((G.GAME.probabilities.normal or 1) / card.ability.extra.PerkeoOdds)) then
                if G.consumeables.cards[1] then
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo')), nil)
                            card:set_edition({negative = true}, true)
                            card:add_to_deck()
                            G.consumeables:emplace(card) 
                            return true
                        end
                    }))
                    return {
                        message = "Duplicated",
                        colour = G.C.RED
                    }
                end
                return
            end
        end
    end
}

SMODS.Joker{
    key = 'Spectred',
    rarity = 3,
    cost = 8,
    order = 106,
    prefix_config = {
        key = {mod = false}
    },
    blueprint_compat = true,
    pos = { x = 5, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = {}, 
    calculate = function(self, card, context)  
        if context.destroying_card and context.destroying_card.ability.set == 'Enhanced' then
            return {remove = true}
        end
    end
}

SMODS.Joker{
    key = "subathon_1",
    prefix_config = {
        key = {mod = false}
    },
    Name = "Subathon Joker",
    atlas = 'BChaosU_Jokers',
    pos = { x = 0, y = 1 },
    order = 103,
    rarity = "ultra",
    cost = 10, 

    config = { extra = {chips = 8600, mult = 771, dollars = 69}},
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
}

SMODS.Joker{
    key = "subathon_2",
    prefix_config = {
        key = {mod = false}         
    },
    order = 104,
    Name = "Subathon Joker 2",
    atlas = 'BChaosU_Jokers',
    pos = { x = 1, y = 1 },
    rarity = "ultra",
    cost = 10, 

    config = { extra = {chips = 13950, mult = 811, dollars = 96}},
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
}

SMODS.Joker{
    key = 'null',
    prefix_config = {
    key = {mod = false}
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    pos = { x = 7, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = { t_chips = 200, type = "nil_hand" }, 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.t_chips, localize(card.ability.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["nil"]) then
            return {
                chips = card.ability.t_chips
            }
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["nil_hand"].played > 0 then
            return true
        end
        return false
    end,
}

SMODS.Joker{
    key = 'undiscovered',
    prefix_config = {
    key = {mod = false}
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    pos = { x = 8, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = { t_mult = 25, type = "nil_hand" }, 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.t_mult, localize(card.ability.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["nil_hand"]) then
            return {
                mult = card.ability.t_mult
            }
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["nil_hand"].played > 0 then
            return true
        end
        return false
    end,
}

SMODS.Joker{
    key = 'impossible',
    prefix_config = {
    key = {mod = false}
    },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    pos = { x = 9, y = 0 },
    atlas = 'BChaosU_Jokers',
    config = { Xmult = 5, type = "nil_hand" }, 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.x_mult, localize(card.ability.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["nil"]) then
            return {
                x_mult = card.ability.Xmult
            }
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["nil_hand"].played > 0 then
            return true
        end
        return false
    end,
}

SMODS.Joker {
    key = "pythagorean",
    pos = { x = 7, y = 1 },
    name = "Pythagorean Joker",
    prefix_config = {
        key = {mod = false}
    },
    rarity = "ultra", 
    atlas = 'BChaosU_Jokers',
    blueprint_compat = false,
    cost = 10,
    config = { }
}

SMODS.Joker{
    key = 'pocket_change',
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    pos = { x = 6, y = 0 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {dollars = 0.62, extra = {IncreaseMoney = 0.62}},

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.dollars, card.ability.extra.IncreaseMoney} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                dollars = card.ability.dollars
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
             card.ability.dollars = card.ability.dollars + card.ability.extra.IncreaseMoney
             return {
                 message = "+$",
                 colour = G.C.MONEY 
             }
         end
    end
}


SMODS.Joker{
    key = 'foil_joker',
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    pos = { x = 3, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, chips = 50}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Foil', G.C.DARK_EDITION, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'holo_joker',
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    pos = { x = 4, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, holo_mult = 10}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.holo_mult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult + card.ability.extra.holo_mult,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Holographic', G.C.DARK_EDITION, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'poly_joker',
    rarity = 1,
    cost = 7,
    blueprint_compat = true,
    pos = { x = 5, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, xmult = 1.5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.xmult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Polychrome', G.C.DARK_EDITION, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'edition_negative_joker',
    rarity = 1,
    cost = 7,
    blueprint_compat = true,
    pos = { x = 6, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {card_limit = 1, extra = {mult = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.card_limit} }
    end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.card_limit
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.card_limit
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Negative', G.C.DARK_EDITION, G.C.WHITE, 1.0 )
 	end,    
}

SMODS.Joker{
    key = 'bonus_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 0, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, chips = 30}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Bonus Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'mult_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 1, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, mult_mult = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult + card.ability.extra.mult_mult,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Mult Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'wild_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 2, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, mult_mult = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mult} }
    end,
    calculate = function(self, card, context)
        local random = pseudorandom(pseudoseed('wild_joker'), 1, 4)
        
        if context.joker_main  then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and context.individual then
            card.config.center.rarity = random
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Wild Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'lucky_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 3, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, lucky_mult = 20, dollars = 20, mult_odds = 5, dollars_odds = 15 }},
    loc_vars = function(self, info_queue, card)
         local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds,
            'lucky_joker')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 1,
            card.ability.extra.dollars_odds, 'lucky_money')
        return { vars = {card.ability.extra.mult, mult_numerator, dollars_numerator, card.ability.extra.lucky_mult, mult_denominator, card.ability.extra.dollars, dollars_denominator } }
    end,
    calculate = function(self, card, context)
       
        if context.joker_main  then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'lucky_joker', 1, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult + card.ability.extra.lucky_mult
            else
                ret.mult = card.ability.extra.mult
            end
            if SMODS.pseudorandom_probability(card, 'lucky_money', 1, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end

    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Lucky Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'glass_en_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 4, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, xmult = 2, num = 1, odds = 4 }},
    loc_vars = function(self, info_queue, card)
         local Glass_numerator, glass_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'glass_joker')
        return { vars = {card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.num, card.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult,
            }
        
        end
        if context.after then
            if  SMODS.pseudorandom_probability(card, 'glass_joker', card.ability.extra.num, card.ability.extra.odds) then
                card.glass_trigger = true
                SMODS.destroy_cards(card)
            end
        end

    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Glass Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'steel_en_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 5, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, xmult = 1.5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.xmult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Steel Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'stone_en_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 6, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {chips = 50,}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges] = create_badge('Stone Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'gold_en_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 7, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {dollars = 3, extra = {mult = 4, xmult = 1.5}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.dollars} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.dollars
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Gold Card', HEX('757CDC'), G.C.WHITE, 1.2 )
 	end,
}

SMODS.Joker{
    key = 'red_seal_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 8, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, retriggers = 1}},
    loc_vars = function(self, info_queue, card) 
        return { vars = {card.ability.extra.mult, card.ability.extra.retriggers} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.retrigger_joker_check and context.other_card == card then
            return {repetitions = 1}
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Red Seal', G.C.RED, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'blue_seal_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 9, y = 1 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4}},
    loc_vars = function(self, info_queue, card) 
        return { vars = {card.ability.extra.mult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.end_of_round and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and context.main_eval then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Blue Seal', G.C.BLUE, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'gold_seal_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 9, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4, dollars = 3}},
    loc_vars = function(self, info_queue, card) 
        return { vars = {card.ability.extra.mult, card.ability.extra.dollars} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                dollars = card.ability.extra.dollars
            }
        end
    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Gold Seal', G.C.GOLD, G.C.WHITE, 1.0 )
 	end,
}

SMODS.Joker{
    key = 'purple_seal_joker',
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    pos = { x = 8, y = 2 },
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    config = {extra = {mult = 4}},
    loc_vars = function(self, info_queue, card) 
        return { vars = {card.ability.extra.mult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.selling_self and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'Tarot' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end

    end,
 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Purple Seal', G.C.PURPLE, G.C.WHITE, 1.0 )
 	end,
}


-- Fandom Content --


SMODS.Joker {
    key = "maroon_card",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 0, y = 3 },
    config = { extra = { mult_gain = 2501, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
                colour = G.C.RED,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and G.consumeables.config.card_limit > #G.consumeables.cards and context.main_eval then
            play_sound('timpani')
            SMODS.add_card({ key = "c_fool" })
            card:juice_up(0.3, 0.5)
        end
    end,
}

SMODS.Joker {
    key = "scarlet_card",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 1, y = 3 },
    config = { extra = { mult_gain = 25, mult = 0 } },    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
                colour = G.C.RED,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and G.consumeables.config.card_limit > #G.consumeables.cards and context.main_eval then
            play_sound('timpani')
            SMODS.add_card({ key = "c_fool" })
            card:juice_up(0.3, 0.5)
        end
    end,
}


SMODS.Joker {
    key = "addition_squared",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = "impossible",
    cost = 50,
    prefix_config = {
        key = {mod = false}
    },
    atlas = 'BChaosU_Jokers',
    pos = { x = 0, y = 7 },
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = { lambda_a, lambda_b, lambda_c, lambda_d } }
    end,
    calculate = function(self, card, context)
        local base = lambda_d^(lambda_c^lambda_b)
        local exponent = lambda_a + lambda_c
        local lambda = base ^ exponent

        if context.first_hand_drawn then
            lambda_a = math.random(1,4)
            lambda_b = math.random(1,4)
            lambda_c = math.random(1,4)
            lambda_d = math.random(2,4)
        end
        if context.joker_main then
            return {
                mult = lambda
            }
        end
    end,
}


-- Extreme Decks --


SMODS.Back {
    name = "Extreme Deck",
    key = "extreme",
    prefix_config = {
        key = {mod = false}
    },
    config = {hands = -3, discards = -2},
    pos = {x = 0, y = 0},
    atlas = "BChaosU_centers",
}

SMODS.Back {
    name = "Insane Deck",
    key = "insane",
    prefix_config = {
        key = {mod = false}
    },
    config = {shop_eternals = true, flipped_cards = true, debuff_played_cards = true},
    pos = {x = 1, y = 0},
    atlas = "BChaosU_centers",
}

SMODS.Back {
    name = "Impossible Deck",
    key = "impossible",
    prefix_config = {
        key = {mod = false}
    },
    config = {no_blind_reward = true, dollars = -14, shop_eternals = true, rentals = true, perishables = true, flipped_cards = true, debuff_played_cards = true},
    pos = {x = 2, y = 0},
    atlas = "BChaosU_centers",
}

local Backapply_to_run_Ref = Back.apply_to_run
function Back.apply_to_run(self)
    Backapply_to_run_Ref(self)
    if self.effect.config.all_eternal then
        G.GAME.modifiers.all_eternal = true
    else
        G.GAME.modifiers.all_eternal = false
    end
    
    if self.effect.config.no_shop_jokers then
        G.GAME.joker_rate = 0
    end
    
    if self.effect.config.flipped_cards then
        G.GAME.modifiers.flipped_cards = 4
    else
        G.GAME.modifiers.flipped_cards = nil
    end

    if self.effect.config.debuff_played_cards then
        G.GAME.modifiers.debuff_played_cards = true
    else
        G.GAME.modifiers.debuff_played_cards = false
    end
    if self.effect.config.shop_eternals then
        G.GAME.modifiers.enable_eternals_in_shop = true
    else
        G.GAME.modifiers.enable_eternals_in_shop = false
    end

    if self.effect.config.rentals then
        G.GAME.modifiers.enable_rentals_in_shop = true
    else
        G.GAME.modifiers.enable_rentals_in_shop = false
    end

    if self.effect.config.perishables then
        G.GAME.modifiers.enable_perishables_in_shop = true
    else
        G.GAME.modifiers.enable_perishables_in_shop = false
    end

    if self.effect.config.no_blind_reward then
        G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
        G.GAME.modifiers.no_blind_reward.Small = true
        G.GAME.modifiers.no_blind_reward.Big = true
    end
end


-- Enhancements --

SMODS.Enhancement{
    key = "blank",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 1, y = 0},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    overrides_base_rank = false,
    any_suit = false,
    always_scores = true,
    weight = 5,
    config = {},
    calculate = function(self, card, context, effect)
    end
}

SMODS.Enhancement{
    key = "tarot_infused",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 0, y = 1},
    atlas = 'BChaosU_centers',
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    overrides_base_rank = false,
    any_suit = false,
    always_scores = false,
    weight = 5,
    config = {},
    calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
				local tcard = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'tarot_infused')
				tcard:add_to_deck()
				G.consumeables:emplace(tcard)
				return true
			end }))
        end
    end
}
SMODS.Enhancement{
    key = "planet_infused",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 1, y = 1},
    atlas = 'BChaosU_centers',
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    overrides_base_rank = false,
    any_suit = false,
    always_scores = false,
    weight = 5,
    config = {},
    calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
				local pcard = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'planet_infused')
				pcard:add_to_deck()
				G.consumeables:emplace(pcard)
				return true
			end }))
        end
    end
}

SMODS.Enhancement{
    key = "spectral_infused",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 2, y = 1},
    atlas = 'BChaosU_centers',
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    overrides_base_rank = false,
    any_suit = false,
    always_scores = false,
    weight = 5,
    config = {},
    calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
				local scard = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'spectral_infused')
				scard:add_to_deck()
				G.consumeables:emplace(scard)
				return true
			end }))
        end
    end
}

SMODS.Enhancement{
    key = "waterlogged",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 1, y = 2},
    atlas = 'BChaosU_centers',
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    overrides_base_rank = false,
    any_suit = false,
    always_scores = true,
    weight = 5,
    config = {},
    calculate = function(self, card, context, effect)
    end
}

-- Tarot Cards --

SMODS.Consumable{
    key = "fabric_tear",
    set = "Tarot",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 0, y = 0},
    atlas = 'BChaosU_Tarot',
    config = {mod_conv = 'm_blank', max_highlighted = 5},
	loc_vars = function(self, info_queue)
        local LetterChoice = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }

    local ChosenLetters = {}
    for i = 1, 8 do
        ChosenLetters[i] = pseudorandom_element(LetterChoice, pseudoseed('TarotNotFound'))
    end
    local ChosenLettersString = table.concat(ChosenLetters, "")
    return { vars = { self.config.max_highlighted, ChosenLettersString } }
	end
}

SMODS.Consumable{
    key = "tarot_tarot",
    set = "Tarot",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 4, y = 0},
    atlas = 'BChaosU_Tarot',
    config = {mod_conv = 'm_tarot_infused', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable{
    key = "planet_tarot",
    set = "Tarot",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 3, y = 0},
    atlas = 'BChaosU_Tarot',
    config = {mod_conv = 'm_planet_infused', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

SMODS.Consumable{
    key = "spectral_tarot",
    set = "Tarot",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 2, y = 0},
    atlas = 'BChaosU_Tarot',
    config = {mod_conv = 'm_spectral_infused', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}


SMODS.Consumable{
    key = "water",
    set = "Tarot",
    prefix_config = {
        key = {mod = false}
    },
    pos = {x = 5, y = 0},
    atlas = 'BChaosU_Tarot',
    config = {mod_conv = 'm_waterlogged', max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}

-- Hand Types --

SMODS.PokerHand{
    key = 'nil_hand',
    prefix_config = {
    key = {mod = false}
    },
    chips = 150,
    mult = 10,
    l_chips = 50,
    l_mult = 5,
    example = {
        { 'S_BLANK',    true, 'm_blank' },
        { 'S_BLANK',    true, 'm_blank' },
        { 'S_BLANK',    true, 'm_blank' },
        { 'S_BLANK',    true, 'm_blank' },
        { 'S_BLANK',    true, 'm_blank' },
    },
    visible = false,
    evaluate = function(parts, hand)
        local blanks = {}
        for i, card in ipairs(hand) do
            if card.config.center_key == 'm_blank' then 
                blanks[#blanks+1] = card
            end
        end
        return #blanks >= 5 and {blanks} or {}
    end,
}



--Code thanks to UnusedParadox--

local delta_extra_slots = function(self)
    local slots = 0
    if self.config.center_key == "j_edition_negative_joker" then
        slots = slots + 1
    end
    return slots
end
local delta_empty_slots = function(self)
    if G.jokers ~= nil then
        return (G.jokers.config.card_limit - #G.jokers.cards + delta_extra_slots(self)) > 0
    else
        return false
    end
end
-- Hooking buyspace checks
local delta_buyspace_check_old = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    return delta_empty_slots(card) or delta_buyspace_check_old(card)
end
local delta_cardselect_check_old = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    local card = e.config.ref_table
    if delta_empty_slots(card) then
        e.config.colour = G.C.GREEN
        e.config.button = 'use_card'
    else
        delta_cardselect_check_old(e)
    end
end

local smods_shatters_ref = SMODS.shatters
function SMODS.shatters(card)
    if card.config.center.key == "j_glass_en_joker" then
        return true
    end
    return smods_shatters_ref(card)
end

SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true,
    }
end


lambda_a = math.random(1,4)
lambda_b = math.random(1,4)
lambda_c = math.random(1,4)
lambda_d = math.random(2,4)