import Testing

@testable import TicTacToe

@Test func shouldHaveAGame() async throws {
    let game = Game()
}

@Test func shouldHaveABoard() async throws {
    let game = Game()

    #expect(game.board != nil)
}
