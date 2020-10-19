;Header and description
(define (domain starcraft)
;remove requirements that are not needed
(:requirements :typing :durative-actions :fluents)
(:types specie map)

(:predicates
    (ai-level ?s)
)

(:functions
    (cristals ?s - specie)
    (depots ?s - specie)
    (supply ?s - specie)
    (marines ?s - specie)
    (available ?m - map))

(:durative-action collect
    :parameters (?s - specie ?m - map)
    :duration (= ?duration 1)
    :condition 
        (at start (>= (available ?m) 0))
    :effect (and 
        (at start (decrease (available ?m) 10))
        (at end (increase (cristals ?s) 10))
    )
)

(:durative-action build-depot
    :parameters (?s - specie)
    :duration (= ?duration 40)
    :condition  
        (at start (>= (cristals ?s) 100))
    :effect (and
        (at start (decrease (cristals ?s) 100))
        (at end (increase (depots ?s) 1))
        (at end (increase (supply ?s) 10))
    )
)

(:durative-action train-marine
    :parameters (?s - specie)
    :duration (= ?duration 20)
    :condition (and
        (at start (>= (cristals ?s) 50))
        (at start (>= (supply ?s) 1))
    )
    :effect (and
        (at start (decrease (supply ?s) 1))
        (at start (decrease (cristals ?s) 50))
        (at end (increase (marines ?s) 1))
    )
)
)