(define (problem thirdproblem)
    (:domain match-three)
    (:objects 
        G H R S - tile ; tiles
        A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4 - cell ; cells
    )
    (:init
        
        ;initial state of the board
		                                                
        (empty A1)(at S A2)(at G A3 )(at H A4)    
                                                        
        (at S B1)(at H B2)(at G B3)(at R B4)    
                                                        
        (at S C1)(at H C2)(at R C3)(at G C4)    
                                                        
        (at H D1)(at H D2)(at H D3)(at R D4)    
        

        ;valid move
        (is-valid A2 A3 )
        (is-valid A2 B2)
        (is-valid A3 A2)(is-valid A3 B3)
        (is-valid A4 A3 )(is-valid A4 B4)

        (is-valid B1 B2)(is-valid B1 C1)
        (is-valid B2 B1)(is-valid B2 B3)
        (is-valid B2 A2)(is-valid B2 C2)
        (is-valid B3 B2)(is-valid B3 A3 )
        (is-valid B3 C3)
        (is-valid B4 B3)(is-valid B4 A4)

        (is-valid C1 C2)(is-valid C1 B1)
        (is-valid C1 D1)
        (is-valid C2 C1)(is-valid C2 C3)
        (is-valid C2 B2)(is-valid C2 D2)
        (is-valid C3 C2)(is-valid C3 B3)
        (is-valid C3 D3)
        (is-valid C4 C3)(is-valid C4 D4)

        (is-valid D1 D2)(is-valid D1 C1)
        (is-valid D2 D1)(is-valid D2 D3)
        (is-valid D2 C2)
        (is-valid D3 D2)(is-valid D3 C3)
        (is-valid D4 D3)(is-valid D4 C4)

        ; Tile G and S
        (is-tile-gs G S)
        (is-tile-gs S G)

        ; RepresenS tile S
        (is-tile-s S)

        ; Possible matches on row
        (match-three A2 A3 A4)
        (match-three A2 A4 A3 )

        (match-three A3 A2 A4)
        (match-three A3 A4 A2)

        (match-three A4 A3 A2)
        (match-three A4 A2 A3 )
        
        (match-three B1 B2 B3)
        (match-three B1 B3 B2)

        (match-three B2 B1 B3)
        (match-three B2 B3 B1)
        (match-three B2 B3 B4)
        (match-three B2 B4 B3)

        (match-three B3 B2 B1)
        (match-three B3 B1 B2)
        (match-three B3 B4 B2)
        (match-three B3 B2 B4)
        
        (match-three B4 B3 B2)
        (match-three B4 B2 B3)

        (match-three C1 C2 C3)
        (match-three C1 C3 C2)

        (match-three C2 C1 C3)
        (match-three C2 C3 C1)
        (match-three C2 C3 C4)
        (match-three C2 C4 C3)

        (match-three C3 C2 C1)
        (match-three C3 C1 C2)
        (match-three C3 C4 B2)
        (match-three C3 B2 B4)
        
        (match-three C4 C3 C2)
        (match-three C4 C2 C3)


        (match-three D1 D2 D3)
        (match-three D1 D3 D2)
        
        (match-three D2 D1 D3)
        (match-three D2 D3 D1)
        (match-three D2 D3 D4)
        (match-three D2 D4 D3)

        (match-three D3 D2 D1)
        (match-three D3 D1 D2)
        (match-three D3 D4 D2)
        (match-three D3 D2 D4)
        
        (match-three D4 D3 D2)
        (match-three D4 D2 D3)

        ; Possible matches col

        (match-three A2 B2 C2)
        (match-three A2 C2 B2)

        (match-three A3 B3 C3)
        (match-three A3 C3 B3)

        (match-three B1 C1 D1)
        (match-three B1 D1 C1)

        (match-three B2 A2 C2)   
        (match-three B2 C2 A2)
        

        (match-three B2 C2 D2)
        (match-three B2 D2 C2)

        (match-three B3 A3 C3)
        (match-three B3 C3 A3 )

        (match-three B3 C3 D3)
        (match-three B3 D3 C3)

        (match-three C1 B1 D1)
        (match-three C1 D1 B1)

        (match-three C2 A2 B2)
        (match-three C2 B2 A2)

        (match-three C2 B2 D2)
        (match-three C2 D2 B2)

        (match-three C3 A3 B3)
        (match-three C3 B3 A3)

        (match-three C3 B3 D3)
        (match-three C3 D3 B3)

        (match-three D1 B1 C1)
        (match-three D1 C1 B1)

        (match-three D2 B2 C2)
        (match-three D2 C2 B2)

        (match-three D3 B3 C3)
        (match-three D3 C3 B3)
        
        (match-three D4 B4 C4)
        (match-three D4 C4 B4)
    )
    
    (:goal
        ; the goal is to have the board empty
	    (and
                                                                  
            (empty A1)(empty A2)(empty A3)(empty A4)     
                                                               
            (empty B1)(empty B2)(empty B3)(empty B4)      
                                                                 
            (empty C1)(empty C2)(empty C3)(empty C4)      
                                                               
            (empty D1)(empty D2)(empty D3)(empty D4)     
	    )
    )
)