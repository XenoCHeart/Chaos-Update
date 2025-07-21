return {
    descriptions = {
        Mod = {
            BalatroChaosUpdate = {
                name = "CHAOS 1.0.0",
                text = {
                    "{s:1.5,E:1}[Welcome to Chaos]{}",
                    " ",
                    "You have been selected to play a {X:dark_edition,C:edition,E:1}BRAND NEW ‎‎‎‎CHAOTIC‎‎‎‎UPDATE{} before anyone else.",
                    "{s:0.5}----------------------------------------------------------------------------------------------------------------------------------------------------------{}",
                    "{s:1.5,E:1}[Information]{}",
                    " ",
                    "This is an add-on to Parallel Update (Community Update) that can be used on its own.",
                    "This is for all the wacky, crazy, and downright chaotic things that don't fit in the main mod.",
                    "",
                }
            }
        },

        Back = {
            b_extreme = {
                name = "Extreme Deck",
                text = {
                    "{C:blue}1{} hand",
                    "{C:red}1{} discard",
                }
            },
            b_insane = {
                name = "Insane Deck",
                text = {
                    "{C:attention}Played{} cards become {C:attention}debuffed{} after scoring",
                    "Jokers will spawn as Eternal regardless of stake",
                    "{C:green}1 in 4{} cards are drawn face down",
                }
            },
            b_impossible = {
                name = "Impossible Deck",
                text = {
                    "{C:attention}Played{} cards become {C:attention}debuffed{} after scoring",
                    "Jokers will spawn as Eternal, perishable,",
                    "and/or rental regardless of stake",
                    "{C:green}1 in 4{} cards are drawn face down",
                    "Small and Big Blind give no money",
                    "Start with {C:money}$-10{}",
                }
            },
        },
        Enhanced = {
            m_blank = {
                name = "Blank Card",
                text = {
                    "{C:inactive}Does nothing?",
                },
            },
            m_tarot_infused = {
                name = "Tarot Infused Card",
                text = {
                    "{C:tarot}+1{} Tarot Card",
                },
            },
            m_planet_infused     = {
                name = "Planet Infused Card",
                text = {
                    "{C:planet}+1{} Planet Card",
                },
            },
            m_spectral_infused     = {
                name = "Spectral Infused Card",
                text = {
                    "{C:spectral}+1{} Spectral Card",
                },
            },
            m_waterlogged     = {
                name = "Waterlogged Card",
                text = {
                    "Always Scores",
                },
            },
        },
        Joker = {
            j_Chaotic_Joker = {
                name = "Chaotic Joker",
                text = {
                    "{X:red,C:white}X#1#{} Mult",
                },
            },
            j_toker = {
                name = "Toker",
                text = {
                    "{C:green}#1# in #2#{} to score",
                    "{C:chips}+#3#{} Chips",
                },
            },
            j_bootleg = {
                name = "Bootleg Joker",
                text = {
                    "{C:green}Even chance{} to score",
                    "{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
                    "{X:chips,C:white}X#3#{} Chips, {X:mult,C:white}X#4#{} Mult",
                    "{X:chips,C:white}^#5#{} Chips, {X:mult,C:white}^#6#{} Mult",
                    "or {C:money}+$#7#{}",
                },
            },
            j_subathon_1 = {
                name = "Subathon Joker",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:mult}+#2#{} Mult",
                    "{C:money}+$#3#{} at end of round",
                },
            },
            j_subathon_2 = {
                name = "Subathon Joker 2",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:mult}+#2#{} Mult",
                    "{C:money}+$#3#{} at end of round",
                },
                unlock = {
                    "Complete {X:green,C:white}Subathon{}",
                    "{X:purple,C:white}https://www.twitch.tv/murphyobv{}",
                }
            },
            j_Murphy = {
                name = "Murphy's Law",
                text = {
                "At the beginning of the round",
                "{C:green}#2# in #3#{} chance to create a",
                "{C:attention}Glass, Red Seal King of {}{C:hearts}Hearts{}",
                "{C:red}ELSE{}, create {C:attention}2 Blank Cards{}.",
                "{C:green}#2# in #4#{} chance to gain {C:money}$#1#{} at end of round",
                }
            },
            j_Roffle = {
                name = "Roffle's Victory Lap",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "Creates a {C:dark_edition}Negative{} copy of",
                    "{C:attention}1{} random {C:attention}consumable{}",
                    "card in your possession",
                    "at the end of the {C:attention}shop",
                    " ",
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for each card {C:attention}sold{}, halves",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {X:mult,C:white} X#4# {C:inactive} Mult)",
                }
            },
            j_Spectred = {
                name = "Dr. Spectred's Delete Button",
                text = {
                    "When an {C:attention}Enhanced{} card",
                    "is scored, destroy it.",            
                }
            },
            j_null = {
                name = "     Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_undiscovered = {
                name = "Undiscovered Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_impossible = {
                name = "The Impossible",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_pythagorean = {
                name = "Pythagorean Joker",
                text = {
                    "Set {C:chips}Chips{} and {C:mult}Mult{} to the {C:attention}square ",
                    "{C:attention}root{} of the summed {C:attention}squares{} of ",
                    "{C:chips}Chips{} and {C:mult}Mult{}",
                    "{s:0.8,C:inactive}(Example: 3 x 4 -> 5 x 5)",
                }
            },
            j_pocket_change = {
                name = "Pocket Change",
                text = {
                    "{C:money}+$#1#{}",
                    "Increases by",
                    "{C:money}+$#2#{} at end of round"
                }
            },
            j_foil_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:chips,T:e_foil}+#2#{} Chips",
                },
            },
            j_holo_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:mult,T:e_holo}+#2#{} Mult",
                },
            },
            j_poly_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{X:mult,C:white,T:e_polychrome}X#2#{} Mult",
                },
            },
            j_edition_negative_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:dark_edition,T:e_negative}+#2#{} Joker Slot",
                },
            },
            j_bonus_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:chips}+#2#{} extra chips",
                },
            },
            j_mult_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:mult}+#2#{} Mult",
                },
            },
            j_wild_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "can be used",
                    "as any rarity",
                },
            },
            j_lucky_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:green}#2# in #5#{} chance",
                    "for {C:mult}+#4#{} Mult",
                    "{C:green}#3# in #7#{} chance",
                    "to win {C:money}$#6#",
                },
            },

            j_glass_en_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{X:mult,C:white} X#2# {} Mult",
                    "{C:green}#3# in #4#{} chance to",
                    "destroy card",
                },
            },

            j_steel_en_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{X:mult,C:white} X#2# {} Mult",
                    "while this card",
                    "stays in joker slot",
                },
            },

            j_stone_en_joker = {
                name = "",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },

            j_gold_en_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "{C:money}$#2#{} if this",
                    "card is held in joker",
                    "slot at end of round",
                },
            },

            j_red_seal_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "Retrigger this",
                    "card {C:attention}#2#{} time",
                },
            },
            j_blue_seal_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "Creates the {C:planet}Planet{} card",
                    "for final played {C:attention}poker hand{}",
                    "of round",
                    "{C:inactive}(Must have room)",
                },
            },
            j_gold_seal_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "Earn {C:money}$#2#{} when this",
                    "card is triggered",
                },
            },

            j_purple_seal_joker = {
                name = "Joker",
                text = {
                    "{C:mult,s:1.1}+#1#{} Mult",
                    "Creates a {C:tarot}Tarot{} card",
                    "when {C:attention}sold",
                    "{C:inactive}(Must have room)",
                },
            },

            j_maroon_card = {
                name = "Maroon Card",
                text = {
                    "This Joker gains",
                    "{C:red}+#1#{} Mult when any",
                    "{C:attention}Booster Pack{} is skipped",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "Creates {C:tarot}The Wiener{} at end of round",
                },
            },


            j_scarlet_card = {
                name = "Scarlet Card",
                text = {
                    "This Joker gains",
                    "{C:red}+#1#{} Mult when any",
                    "{C:attention}Booster Pack{} is skipped",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "Creates {C:tarot}The Wiener{} at end of round",
                },
            },

            j_addition_squared = {
                name = "Addition Squared",
                text = {
                    "{C:mult}+(d^(c^b))^(a+c){} Mult",
                    "{X:dark_edition,C:white}a = #1#,‎ ‎ b = #2#,‎ ‎ c = #3#,‎ ‎ d = #4#",
                    "{C:inactive,s:0.7}(Values Change at start of round)",

                },
            },
        },
        Other = {
        },
        Planet = {
        },
        Spectral = {

        },
        Stake = {

        },
        Tag = {

        },
        Tarot = {
            c_fabric_tear = {
                name = "ERROR: Tarot Not Found",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into a {C:dark_edition,E:1}#2#{} {C:Attention}Card",
                }
            },
           c_tarot_tarot = {
                name = "The Tarot",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into a {C:attention}#2#{} {C:Attention}",
                }
            },
           c_planet_tarot = {
                name = "The Planet",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into a {C:attention}#2#{} {C:Attention}",
                }
            },
           c_spectral_tarot = {
                name = "The Spectral",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into a {C:attention}#2#{} {C:Attention}",
                }
            },
           c_water = {
                name = "The Water",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into a {C:attention}#2#{} {C:Attention}",
                }
            },
        },
        Voucher = {
        },
    },
    misc = {
        labels = {
            ultra = "Ultra",
            impossible = "Impossible",
        },
        poker_hand_descriptions = {
            nil_hand = {"Five Blank Cards"},
        },
        poker_hands = {
            nil_hand = "nil",
        },
        dictionary = {
            k_ultra = "Ultra",
            k_impossible = "Impossible",
        },

        suits_plural={
            Paddles = "Paddles",
            Cats = "Cats",
            Ships = "Ships",
            Plus = "Pluses",
            Star = "Stars",
            Moon = "Moons",
            Bolts = "Bolts",
            ["Four-Point"] = "Four-Point Stars",
            Arrow = "Arrows",
            Triangle = "Triangles",
            Shield = "Shields",
            ["Twin Point"] = "Twin Points",
            X = "Xs",
            ["Six-Point"] = "Six-Point Stars",
            Circle = "Circles",
            Square = "Squares",
        },
        suits_singular={
            Paddles = "Paddle",
            Cats = "Cat",
            Ships = "Ship",
            Plus = "Plus",
            Star = "Star",
            Moon = "Moon",
            Bolts = "Bolt",
            ["Four-Point"] = "Four-Point Star",
            Arrow = "Arrow",
            Triangle = "Triangle",
            Shield = "Shield",
            ["Twin Point"] = "Twin Point",
            X = "X",
            ["Six-Point"] = "Six-Point Star",
            Circle = "Circle",
            Square = "Square",
        },
    },
}