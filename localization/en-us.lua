return {
    descriptions = {
        Joker = {
            j_upgradedfood_cybernana = {
                name = 'Cybernana MK920',
                text = {
                    'This Joker gains {X:mult,C:white}X#1#{} Mult',
                    'per round played',
                    '{C:green}#2# in #3#{} chance this card',
                    'is destroyed at end of round',
                    '{C:inactive}(Currently {X:mult,C:white} X#4#{C:inactive} Mult)'
                },
                unlock = {
                    "Naturally destroy",
                    "a {E:1,C:attention}#1#{}",
                },
            },
            j_upgradedfood_buttpopcorn = {
                name = 'Buttered Popcorn',
                text = {
                    '{C:mult}+#1#{} Mult',
                    '{C:mult}-#2#{} Mult per round played',
                },
                unlock = {
                    "Naturally destroy",
                    "a {E:1,C:attention}#1#{}",
                },
            },
            j_upgradedfood_sundae = {
                name = 'Sundae',
                text = {
                    '{C:chips}+#1#{} Chips',
                    '{C:chips}-#2#{} Chips for',
                    'every hand played'
                },
                unlock = {
                    "Naturally destroy",
                    "an {E:1,C:attention}#1#{}",
                },
            },
            j_upgradedfood_hardseltzer = {
                name = 'Hard Seltzer',
                text = {
                    'Retrigger all cards played',
                    'for the next {C:attention}#1#{} rounds',
                },
                unlock = {
                    "Naturally destroy",
                    "a {E:1,C:attention}#1#{}",
                },
            },
            j_upgradedfood_canofbeans = {
                name = 'Can of Beans',
                text = {
                    '{C:attention}+#3#{} hand size',
                    'for the next',
                    '{C:attention}#1#{} rounds',
                },
                unlock = {
                    "Naturally destroy",
                    "a {E:1,C:attention}#1#{}",
                },
            },
            j_upgradedfood_tsukemen = {
                name = 'Tsukemen',
                text = {
                    '{X:mult,C:white} X#1#{} Mult,',
                    'gains {X:mult,C:white} X#2#{} Mult',
                    'per {C:attention}card{} discarded,',
                    'loses {X:mult,C:white} X#3# {} Mult',
                    'after {C:attention}hand is scored{}',
                },
                unlock = {
                    "Naturally destroy",
                    "a {E:1,C:attention}#1#{}",
                },
            },
        },
        Other = {
            artist_credits_upgradedfood = {
                name = 'Credits',
                text = {
                    '{C:chips}Art:{} #1#',
                    '{C:money}Design:{} #2#',
                }
            },
        },
    }
}
