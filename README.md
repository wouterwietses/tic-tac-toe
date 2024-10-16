# Tic Tac Toe

## Gameplay

- There are two players in the game. One identified by X and the other by O.
- The board is a 3 by 3 grid.
- The first player is X
- The players will mark on their turn a space with a point
- The first player that has three in a row will win the game.

## Game loop

```
while(no_winner)
    player input: mark space with player identifier
    if player has three in a row
        player is winner
        no_winner is false
    else
        switch player
    end if
end while
```

## Board

```
-------------
| 1 | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 | 
-------------
```

## Solutions

There are 8 solutions possible. These can be the lines:

- 1, 2, 3
- 4, 5, 6
- 7, 8, 9
- 1, 4, 7
- 2, 5, 8
- 3, 6, 9
- 1, 5, 9
- 7, 5, 3
