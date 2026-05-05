SMODS.Joker{ --Cybernana MK920
    name = "Cybernana MK920",
    key = "cybernana",
    config = {
        extra = {
            x_mult_add = 3,
            odds = 10000,
            x_mult = 3,
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "xmult", "scaling", "chance", "food" },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'cavendish_extinct',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'mrkyspices', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'Cybernana MK920')
        return {vars = {card.ability.extra.x_mult_add, new_numerator, new_denominator, card.ability.extra.x_mult}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.cavendish_extinct
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_cavendish'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_cavendish' }
        end
        return { vars = { other_name } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand and card.ability.extra.x_mult > 1 then
            return {
                xmult = card.ability.extra.x_mult,
            }
        elseif context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            if SMODS.pseudorandom_probability(card, 'Cybernana MK920', 1, card.ability.extra.odds, 'Cybernana MK920') then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                }))
                return {
                    message = localize('k_extinct_ex')
                }
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "x_mult",
                    scalar_value = "x_mult_add",
                    operation = "+",
                    message_key = 'a_xmult',
                    message_colour = G.C.RED
                })
            end
        end
    end
}

SMODS.Joker{ --Buttered Popcorn
    name = "Buttered Popcorn",
    key = "buttpopcorn",
    config = {
        extra = {
            mult = 50,
            mult_remove = 5,
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "mult", "scaling", "food" },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'popcorn_eaten',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'amoryax', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_remove}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.popcorn_eaten
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_popcorn'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_popcorn' }
        end
        return { vars = { other_name } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand and card.ability.extra.mult > 1 then
            return {
                mult = card.ability.extra.mult,
            }
        elseif context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            if card.ability.extra.mult - card.ability.extra.mult_remove > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_remove",
                    operation = "-",
                    message_key = 'a_mult_minus',
                    message_colour = G.C.RED
                })
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker{ --Sundae
    name = "Sundae",
    key = "sundae",
    config = {
        extra = {
            chips = 250,
            chips_remove = 5,
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "chips", "scaling", "food" },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'ice_cream_eaten',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'mrkyspices', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        return {vars = {card.ability.extra.chips, card.ability.extra.chips_remove}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.ice_cream_eaten
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_ice_cream'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_ice_cream' }
        end
        return { vars = { other_name } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips,
            }
        elseif context.after and not context.blueprint and not context.repetition then
            if card.ability.extra.chips - (card.ability.extra.chips_remove) > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chips_remove",
                    operation = "-",
                    message_key = 'a_chips_minus',
                    message_colour = G.C.BLUE
                })
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_melted_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker{ --Hard Seltzer
    name = "Hard Seltzer",
    key = "hardseltzer",
    config = {
        extra = {
            rounds = 10,
            rounds_remove = 1
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "retrgger", "scaling", "food" },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'seltzer_drank',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'mrkyspices', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        return {vars = {card.ability.extra.rounds, card.ability.extra.rounds_remove}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.seltzer_drank
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_selzer'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_selzer' }
        end
        return { vars = { other_name } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        elseif context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.rounds = card.ability.extra.rounds - card.ability.extra.rounds_remove
            if card.ability.extra.rounds <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_drank_ex'),
                    colour = G.C.FILTER
                }
            else
                return {
                    message = card.ability.extra.rounds..'',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Joker{ --Can of Beans
    name = "Can of Beans",
    key = "canofbeans",
    config = {
        extra = {
            hand_size = 5,
            rounds = 10,
            rounds_remove = 1
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "hand_size", "scaling", "food" },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'turtle_bean_eaten',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'mrkyspices', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        return {vars = {card.ability.extra.rounds, card.ability.extra.rounds_remove, card.ability.extra.hand_size}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.turtle_bean_eaten
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_turtle_bean'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_turtle_bean' }
        end
        return { vars = { other_name } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.rounds = card.ability.extra.rounds - card.ability.extra.rounds_remove
            if card.ability.extra.rounds <= 0 then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                return {
                    message = card.ability.extra.rounds..'',
                    colour = G.C.FILTER
                }
            end
        end
    end
}

SMODS.Joker{ --Tsukemen
    name = "Tsukemen",
    key = "tsukemen",
    config = {
        extra = {
            x_mult = 2,
            x_mult_add = 0.1,
            x_mult_remove = 0.25,
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    pools = {
        Food = true,
    },
    attributes = { "xmult", "scaling", "discards", "hands", "food" },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = false,
    atlas = 'Jokers',
    yes_pool_flag = 'ramen_eaten',
    loc_vars = function(self, info_queue, card)
        if card and card.area and card.area.config.collection then info_queue[#info_queue+1] = {set = 'Other', vars = {'palestjade', 'sugariimari'}, key = 'artist_credits_upgradedfood'} end
        return {vars = {card.ability.extra.x_mult, card.ability.extra.x_mult_add, card.ability.extra.x_mult_remove}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'upgradedfood_destroy_joker' then
            return G.GAME.pool_flags.ramen_eaten
        end
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['j_ramen'].discovered then
            other_name = localize { type = 'name_text', set = 'Joker', key = 'j_ramen' }
        end
        return { vars = { other_name } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand and card.ability.extra.x_mult > 1 then
            return {
                xmult = card.ability.extra.x_mult,
            }
        elseif context.discard and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "x_mult",
                scalar_value = "x_mult_add",
                operation = "+",
                scaling_message = {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult_add}},
                    colour = G.C.RED,
                    delay = 0.2
                }
            })
        elseif context.after and context.cardarea == G.jokers and not context.blueprint then
            if card.ability.extra.x_mult - card.ability.extra.x_mult_remove >= 1 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "x_mult",
                    scalar_value = "x_mult_remove",
                    operation = "-",
                    scaling_message = {
                        card = card,
                        focus = card,
                        message = localize{type='variable',key='a_xmult_minus',vars={card.ability.extra.x_mult_remove}},
                        colour = G.C.RED
                    }
                })
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end
}
