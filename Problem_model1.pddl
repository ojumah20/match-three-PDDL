(define (problem firstproblem)
    (:domain match-three)
    (:objects 
        G H R S - tile ; tiles
        A1 A2 A3 B1 B2 B3 C1 C2 C3 - cell ; cells
    )
    (:init

	    ;initial state of the board  
	    
        (at G A1)(at H A2)(at G A3)      
       
        (at H B1)(at H B2)(at R B3)     
       
        (at R C1)(at R C2)(at G C3)      
        

        
        ;valid moves for swapping
        (is-valid A1 A2)(is-valid A1 B1)
        (is-valid A2 A1)(is-valid A2 A3)
        (is-valid A2 B2)
        (is-valid A3 A2)(is-valid A3 B3)

        (is-valid B1 B2)(is-valid B1 A1)
        (is-valid B1 C1)
        (is-valid B2 B1)(is-valid B2 B3)
        (is-valid B2 A2)(is-valid B2 C2)
        (is-valid B3 B2)(is-valid B3 A3)
        (is-valid B3 C3)

        (is-valid C1 C2)(is-valid C1 B1)

        (is-valid C2 C1)(is-valid C2 C3)
        (is-valid C2 B2)
        (is-valid C3 C2)(is-valid C3 B3)
        
        ;valid moves for matching three tiles horizontally
        (match-three A1 A2 A3)
        (match-three A1 A3 A2)
        (match-three A2 A1 A3)
        (match-three A2 A3 A1)
        (match-three A3 A2 A1)
        (match-three A3 A1 A2)

        (match-three B1 B2 B3)
        (match-three B1 B3 B2)
        (match-three B2 B1 B3)
        (match-three B2 B3 B1)
        (match-three B3 B2 B1)
        (match-three B3 B1 B2)

        (match-three C1 C2 C3)
        (match-three C1 C3 C2)
        (match-three C2 C1 C3)
        (match-three C2 C3 C1)
        (match-three C3 C2 C1)
        (match-three C3 C1 C2)
        
        
        ;valid moves for matching three tiles vertically
        (match-three A1 B1 C1)
        (match-three A1 C1 B1)
        (match-three A2 B2 C2)
        (match-three A2 C2 B2)
        (match-three A3 B3 C3)
        (match-three A3 C3 B3)

        (match-three B1 A1 C1)
        (match-three B1 C1 A1)
        (match-three B2 A2 C2)
        (match-three B2 C2 A2)
        (match-three B3 A3 C3)
        (match-three B3 C3 A3)

        (match-three C1 A1 B1)
        (match-three C1 B1 A1)
        (match-three C2 A2 B2)
        (match-three C2 B2 A2)
        (match-three C3 A3 B3)
        (match-three C3 B3 A3)
    )
    
    (:goal
        ; The goal is to have the board empty
	    (and
                                                
            (empty A1)(empty A2)(empty A3)    
                                                
            (empty B1)(empty B2)(empty B3)   
                                                
            (empty C1)(empty C2)(empty C3)   
	    )
    )
     
)