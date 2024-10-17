import Testing

@testable import TicTacToe

@Test func allPositionsAreEmptyInitially() async throws {
    let game = Game()
    
    #expect(game.board.description == """
-------------
|   |   |   |
|   |   |   |
|   |   |   |
-------------
""")
}

@Test func initialGameStatusInProgress() async throws {
    let game = Game()

    #expect(game.status == .inProgress)
}

@Test func playerOneWinsWithTopRow() async throws {
    let game = playGameWithPlayerOneAsWinner()

    #expect(game.board.description == """
-------------
| X | X | X |
| O | O |   |
|   |   |   |
-------------
""")
}

@Test func playerOneWinsGameStatus() async throws {
    let game = playGameWithPlayerOneAsWinner()

    #expect(game.status == .playerWon(Player(marker: "X")))
}

@Test func aPositionCanOnlyBeAssignedOnce() async throws {
    let game = Game()
    
    game.play(position: 1)

    #expect(throws: Board.Error.positionAlreadyAssigned) {
        game.play(position: 1)
    }
}

@Test func playerTwoWinsWithTopRow() async throws {
    let game = Game()

    game.play(position: 4)
    game.play(position: 1)
    game.play(position: 5)
    game.play(position: 2)
    game.play(position: 7)
    game.play(position: 3)

    #expect(game.status == .playerWon(Player(marker: "O")))
}

func playGameWithPlayerOneAsWinner() -> Game {
    let game = Game()

    game.play(position: 1)
    game.play(position: 4)
    game.play(position: 2)
    game.play(position: 5)
    game.play(position: 3)

    return game
}
