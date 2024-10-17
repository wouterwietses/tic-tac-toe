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

@Test func playerOneWinsWithTopRow() async throws {
    let game = Game()

    game.play(position: 1)
    game.play(position: 4)
    game.play(position: 2)
    game.play(position: 5)
    game.play(position: 3)

    #expect(game.board.description == """
-------------
| X | X | X |
| O | O |   |
|   |   |   |
-------------
""")
}

@Test func playerOneWinsGameStatus() async throws {
    let game = Game()

    game.play(position: 1)
    game.play(position: 4)
    game.play(position: 2)
    game.play(position: 5)
    game.play(position: 3)

    #expect(game.status == .playerWon(Player(marker: "X")))
}
