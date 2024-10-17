import Testing

@testable import TicTacToe

@Test func shouldHaveABoard() async throws {
    let game = Game()

    #expect(game.board != nil)
}

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
