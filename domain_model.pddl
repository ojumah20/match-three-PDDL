(define (domain match-three)

	(:requirements :strips :typing :negative-preconditions :equality :disjunctive-preconditions)

	(:types cell tile)

	(:predicates
		(at ?tile - tile ?cell - cell)
		(is-valid ?cell - cell ?cell2 - cell)
		(match-three ?c1 - cell ?c2 - cell ?c3 - cell)
		(empty ?cell - cell)
		(is-tile-gs ?t1 - tile ?t2 - tile)
		(is-tile-s ?t - tile)
	)
	

	(:action swap
		:parameters (?t1 - tile ?c1 - cell ?t2 - tile ?c2 - cell)
		:precondition (and 
			(not (= ?t1 ?t2))
			(is-valid ?c1 ?c2)
			(not (empty ?c1))
			(not (empty ?c2))
			(not (is-tile-gs ?t1 ?t2))
			(at ?t1 ?c1)
			(at ?t2 ?c2)
		)
		:effect (and 
			(not (at ?t1 ?c1))
			(at ?t1 ?c2)
			(not (at ?t2 ?c2))
			(at ?t2 ?c1)
		)
	)

	(:action swap_s_and_g
		:parameters (?t1 - tile ?c1 - cell ?t2 - tile ?c2 -  cell)
		:precondition (and 
			(not (= ?t1 ?t2))
			(is-valid ?c1 ?c2)
			(not (empty ?c1))
			(not (empty ?c2))
			(at ?t1 ?c1)
			(at ?t2 ?c2)
			(is-tile-gs ?t1 ?t2)
			(is-tile-s ?t1)
		)
		:effect (and 
			(not (at ?t1 ?c1))
			(not (at ?t2 ?c2))
			(at ?t2 ?c1)
			(empty ?c2) 
		)
	)

	(:action swap_g_and_s
		:parameters (?t1 - tile ?c1 - cell ?t2 - tile ?c2 -  cell)
		:precondition (and 
			(not (= ?t1 ?t2))
			(is-valid ?c1 ?c2)
			(not (empty ?c1))
			(not (empty ?c2))
			(at ?t1 ?c1)
			(at ?t2 ?c2)
			(is-tile-gs ?t1 ?t2)
			(is-tile-s ?t2)
		)
		:effect (and 
			(not (at ?t2 ?c2))
			(not (at ?t1 ?c1))
			(at ?t1 ?c2)
			(empty ?c1)
		)
	)	

	(:action match-three-remove
		:parameters (?t1 - tile ?c1 - cell ?t2 - tile ?c2 - cell ?t3 - tile ?c3 - cell)
		:precondition (and 
			(not (empty ?c1))
			(not (empty ?c2))
			(not (empty ?c3))
			(= ?t1 ?t2)
			(= ?t2 ?t3)
			(at ?t1 ?c1)
			(at ?t2 ?c2)
			(at ?t3 ?c3)
			(match-three ?c1 ?c2 ?c3)
		)
		:effect (and 
			(not (at ?t1 ?c1))
			(empty ?c1)
			(not (at ?t2 ?c2))
			(empty ?c2)
			(not (at ?t3 ?c3))
			(empty ?c3)
		)
	)
	
		(:action match-three-keep
		:parameters (?t1 - tile ?c1 - cell ?t2 - tile ?c2 - cell ?t3 - tile ?c3 - cell)
		:precondition (and 
			(not (empty ?c1))
			(not (empty ?c2))
			(not (empty ?c3))
			(= ?t1 ?t2)
			(= ?t2 ?t3)
			(at ?t1 ?c1)
			(at ?t2 ?c2)
			(at ?t3 ?c3)
			(match-three ?c1 ?c2 ?c3)
		)
		:effect (and 
    		(match-three ?c1 ?c2 ?c3)
    		(at ?t1 ?c1)
			(at ?t2 ?c2)
			(at ?t3 ?c3)
		
		)
	)
)
