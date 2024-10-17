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

@Test func firstTurnIsReflectedInBoard() async throws {
    let game = Game()

    game.play(position: 1)

    #expect(game.board.description == """
-------------
| X |   |   |
|   |   |   |
|   |   |   |
-------------
""")
}

@Test func secondPlayerFirstTurnIsReflectedInBoard() async throws {
    let game = Game()

    game.play(position: 1)
    game.play(position: 3)

    #expect(game.board.description == """
-------------
| X |   | O |
|   |   |   |
|   |   |   |
-------------
""")
}
