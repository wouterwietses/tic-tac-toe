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
    let game = try playGameWithPlayerOneAsWinner()

    #expect(game.board.description == """
-------------
| X | X | X |
| O | O |   |
|   |   |   |
-------------
""")
}

@Test func playerOneWinsGameStatus() async throws {
    let game = try playGameWithPlayerOneAsWinner()

    #expect(game.status == .playerWon(Player(marker: .x)))
}

@Test func aPositionCanOnlyBeAssignedOnce() async throws {
    let game = Game()
    
    try game.play(position: 1)

    #expect(throws: Board.Error.positionAlreadyAssigned) {
        try game.play(position: 1)
    }
}

@Test func playerTwoWinsWithTopRow() async throws {
    let game = Game()

    try game.play(position: 4)
    try game.play(position: 1)
    try game.play(position: 5)
    try game.play(position: 2)
    try game.play(position: 7)
    try game.play(position: 3)

    #expect(game.status == .playerWon(Player(marker: .o)))
}

func playGameWithPlayerOneAsWinner() throws -> Game {
    let game = Game()

    try game.play(position: 1)
    try game.play(position: 4)
    try game.play(position: 2)
    try game.play(position: 5)
    try game.play(position: 3)

    return game
}
