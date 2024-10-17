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

@Test func aPositionCanOnlyBeAssignedOnce() async throws {
    let game = Game()
    
    try game.play(position: .one)

    #expect(throws: Board.Error.positionAlreadyAssigned) {
        try game.play(position: .one)
    }
}

@Test func gameCannotContinueAfterWin() async throws {
    let game = Game()

    try game.play(position: .one)
    try game.play(position: .four)
    try game.play(position: .two)
    try game.play(position: .five)
    try game.play(position: .three)

    #expect(throws: Board.Error.gameIsOver) {
        try game.play(position: .nine)
    }
}

@Test func playerTwoWinsWithTopRow() async throws {
    let game = Game()

    try game.play(position: .four)
    try game.play(position: .one)
    try game.play(position: .five)
    try game.play(position: .two)
    try game.play(position: .seven)
    try game.play(position: .three)

    #expect(game.status == .playerWon(Player(marker: .o)))
}

@Test func gameIsADraw() async throws {
    let game = Game()
    
    try game.play(position: .one)
    try game.play(position: .two)
    try game.play(position: .three)
    try game.play(position: .four)
    try game.play(position: .six)
    try game.play(position: .five)
    try game.play(position: .seven)
    try game.play(position: .nine)
    try game.play(position: .eight)

    #expect(game.status == .draw)
}

@Test("All winning permutations", arguments: [
    [Board.Position.one, .four, .two, .five, .three],
    [.four, .one, .five, .two, .six]
])
func allWinningPermutations(plays: [Board.Position]) async throws {
    let game = Game()

    plays.forEach { try! game.play(position: $0) }

    #expect(game.status == .playerWon(Player(marker: .x)))
}
