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
    
    try game.play(position: 1)

    #expect(throws: Board.Error.positionAlreadyAssigned) {
        try game.play(position: 1)
    }
}

@Test func gameCannotContinueAfterWin() async throws {
    let game = Game()

    try game.play(position: 1)
    try game.play(position: 4)
    try game.play(position: 2)
    try game.play(position: 5)
    try game.play(position: 3)

    #expect(throws: Board.Error.gameIsOver) {
        try game.play(position: 9)
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

@Test func gameIsADraw() async throws {
    let game = Game()
    
    try game.play(position: 1)
    try game.play(position: 2)
    try game.play(position: 3)
    try game.play(position: 4)
    try game.play(position: 6)
    try game.play(position: 5)
    try game.play(position: 7)
    try game.play(position: 9)
    try game.play(position: 8)

    #expect(game.status == .draw)
}

@Test("All winning permutations", arguments: [[1,4,2,5,3]])
func allWinningPermutations(plays: [Int]) async throws {
    let game = Game()

    plays.forEach { try! game.play(position: $0) }

    #expect(game.status == .playerWon(Player(marker: .x)))
}
