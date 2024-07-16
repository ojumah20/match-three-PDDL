(define (problem secondproblem)
    (:domain match-three)
    (:objects
        G H R S - tile ; tiles
        A1 A2 A3 B1 B2 B3 C1 C2 C3 D1 D2 D3 - cell ; cells
    )
    (:init
                                            
		                                    
        (at G A1)(at H A2)(at G A3)   
                                            
        (at H B1)(at H B2)(at S B3)   
                                          
        (at S C1)(at S C2)(at G C3)   
                                           
        (at R D1)(at R D2)(at R D3)  
        

        ;valid moves
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
        (is-valid C1 D1)
        (is-valid C2 C1)(is-valid C2 C3)
        (is-valid C2 B2)(is-valid C2 D2)
        (is-valid C3 C2)(is-valid C3 B3)
        (is-valid C3 D3)

        (is-valid D1 D2)(is-valid D1 C1)
        (is-valid D2 D1)(is-valid D2 D3)
        (is-valid D2 C2)
        (is-valid D3 D2)(is-valid D3 C3)


        ; Tile G and S
        (is-tile-gs G S)
        (is-tile-gs S G)

        ; RepresenS tile S
        (is-tile-s S)
        

        ; Possible matches row
        (match-three A1 A2 A3)
        (match-three A1 A3 A2)

        (match-three A2 A1 A3)
        (match-three A2 A3 A1)

        (match-three A3 A2 A1)
        (match-three A3 A1 A2)


        (match-three B1 B2 B3)
        (match-three B1 B3 B2)
        
    
        ;   initial state of the board
		;        1   2   3  
        ;   a  | G | H | G |
        ;      -------------
        ;   b  | H | H | S |
        ;      -------------
        ;   c  | S | S | G |
        ;      -------------
        ;   d  | R | R | R |

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


        (match-three D1 D2 D3)
        (match-three D1 D3 D2)
        
        (match-three D2 D1 D3)
        (match-three D2 D3 D1)

        (match-three D3 D2 D1)
        (match-three D3 D1 D2)



        ; Possible matches col
        (match-three A1 B1 C1)
        (match-three A1 C1 B1)

        (match-three A2 B2 C2)
        (match-three A2 C2 B2)

        (match-three A3 B3 C3)
        (match-three A3 C3 B3)

        (match-three B1 A1 C1)
        (match-three B1 C1 A1)

        
        (match-three B1 C1 D1)
        (match-three B1 D1 C1)

        (match-three B2 A2 C2)   
        (match-three B2 C2 A2)

        (match-three B2 C2 D2)
        (match-three B2 D2 C2)

        (match-three B3 A3 C3)
        (match-three B3 C3 A3)

        (match-three B3 C3 D3)
        (match-three B3 D3 C3)

        (match-three C1 A1 B1)
        (match-three C1 B1 A1)

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
    )
    
    (:goal
        ;goal is to have the board empty
	    (and
    
            (empty A1)(empty A2)(empty A3)     
    
            (empty B1)(empty B2)(empty B3)     
   
            (empty C1)(empty C2)(empty C3)   
    
            (empty D1)(empty D2)(empty D3)   
	    )
    )
)