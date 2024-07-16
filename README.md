# match-three-PDDL
This match-three game involves an AI planner removing tiles based on matching criteria. Three adjacent tiles of the same type, aligned vertically or horizontally, can be removed, leaving the cells empty. The goal is to clear the board entirely.

The planner can swap two adjacent tiles of different types, but not with empty cells. The removal of matched tiles is not automatic, allowing for strategic swaps.

The game includes four tile types: Gryffindor (G), Hufflepuff (H), Ravenclaw (R), and Slytherin (S). Swapping a Gryffindor tile with a Slytherin tile destroys the Slytherin tile, leaving an empty cell.

Plan quality is measured by the number of swaps needed to empty the board.

#Introduction
Classical planning algorithms need a planning model with states, actions, and transitions. This model defines possible system states, actions to change states, and transition rules (Magnaguagno et al., 2019; McCluskey et al., 2017). It includes a domain model, representing persistent knowledge, and a problem instance with specific problem details (McCluskey et al., 2017).

There are several search algorithms used in classical planning engines, including Iterative Widening Search (IWS), Breadth-First Search (BFS), and Fast Downward (FD) (Pellier & Fiorino, 2017).

#Project Goal
The goal of the proejct was to use planning engines to solve a match-three game where the engine can move or keep tiles that match. The initial board setting must be turned into an empty board. Two tiles can be swapped at a time, if they are different types and adjoined either vertically or horizontally.
The planner cannot swap a tile with an empty cell, and the game includes four different tile types. The quality of plans is measured by the number of swaps needed to achieve the goal. Notably, when a Gryffindor tile is swapped with a Slytherin tile, the Slytherin tile is destroyed, resulting in an empty cell. Other types of tiles on the board are Hufflepuff (H) and Ravenclaw (R).
There are three problem files which are based on three levels, each with increasing difficulty. The first level is a 3 by 3 matching problem, followed by a 3 by 4 matching problem, and finally a 4 by 4 matching problem.

#Model Development and Tools
To produce the models used in this project, the problem was initially manually solved to identify the domain model, problem files, possible actions, preconditions, and valid moves. This information was then encoded using PDDL on two automated tools, namely the fast downward planning engine (http://lcas.lincoln.ac.uk/fast-downward/) and editor.planning.domains (http://editor.planning.domains/).
The planning models for this project drew inspiration from four different sources: BLOCKS, GRIPPER, and FLOORTILES (all available on Planning.Domains), as well as the code based on Wokonko (2022) found on GitHub (https://github.com/robertanwokonko/Match-three-PDDL).

# Description of Domain Model

The domain model defines two types: `cell` and `tile`. Key predicates include:
- `at(tile, cell)`
- `is-valid(cell, cell)`
- `match-three(cell, cell, cell)`
- `empty(cell)`
- `is-tile-gs(tile, tile)`
- `is-tile-s(tile)`

Operators:
1. swap(tile1, cell1, tile2, cell2): Swaps two tiles if they are different, adjacent, and neither cell is empty.
2. swap_s_and_g(tile_s, cell_s, tile_g, cell_g): Swaps a Slytherin tile with a Gryffindor tile, destroying the Slytherin tile and leaving an empty cell.
3. swap_g_and_s(tile_g, cell_g, tile_s, cell_s): Similar to `swap_s_and_g`, but with the Gryffindor tile first.
4. match-three-remove(tile, cell, tile, cell, tile, cell): Removes three matching tiles in a row, making the cells empty.
5. match-three-keep(tile, cell, tile, cell, tile, cell): Keeps three matching tiles in place.


# Description of Problem File

Three match-three games (3x3, 3x4, and 4x4) use the same domain model. 

**objects:**
- Tiles: G, H, R, S
- Cells: A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3

**Initialization:**
- `:init` specifies the initial board state using `at(tile, cell)` for tile positions and `is-valid(cell, cell)` for valid swaps.
- `match-three(cell, cell, cell)` defines valid horizontal or vertical matches.

**Goal:**
- All cells must be empty.

# Result from Comparison
**Competition Performance**
  In the IPC-18 deterministic track: 
  Fast Downward (FD): Solved all 10 benchmark problems, averaging 0.67 seconds per problem.
  Editor.Planning.Domains: Solved 6 out of 10 problems, averaging 5.6 seconds per problem.
  
**Match-Three Problem Performance (Before Re-ordering Operators)**
  Operators Order:
  swap
  swap_s_and_g
  swap_g_and_s
  match-three-keep
  match-three-remove
  
  Metrics: Cost, Nodes Generated, Nodes Expanded, Search Time, Swaps
  
| Metric             | Problem 1 (3x3) | Problem 2 (3x4) | Problem 3 (4x4) |
|--------------------|-----------------|-----------------|-----------------|
| **Planners**       | Editor.Planning.Domains | FD              | Editor.Planning.Domains |
| **Cost**           | 6               | 6               | 13              |
| **Nodes Generated**| 51              | 112             | 106             |
| **Nodes Expanded** | 14              | 7               | 64              |
| **Time**           | 0.0000000004s   | 0.00283621s     | 0.004s          |
| **Swaps**          | 3               | 3               | 10              |

Search Algorithms Used
Editor.Planning.Domains: IW for problems 1 and 2, BFS for problem 3.
Fast Downward: A* search with FF heuristic.

# After Re-Ordering the Operators

Re-Ordered Actions:
`swap`
`match-three-keep`
`match-three-remove`
`swap_s_and_g`
`swap_g_and_s`

- **Editor.Planning.Domains**:
  - **Problem 1**: Slight increase in time (0.00000000154972s).
  - **Problem 2**: Significant reduction in time (1.51992 nanoseconds) and nodes generated reduced by 2.
  - **Problem 3**: No significant effect.

- **Fast Downward**:
  - Minimal impact on time, no significant effect on other metrics.

**Conclusion**:
- **Fast Downward** remains the most efficient planner, especially for larger problems, consistent with IPC-18 results.
**contact me**-you can reach out to me at onyekaojumah22@gmail.com if you have any question.
