final class Game {

    enum Status: Equatable {
        case inProgress
        case draw
        case playerWon(Player)
    }

    let board: Board = Board()
    private(set) var status: Status = .inProgress

    private let players: [Player] = [Player(marker: .x), Player(marker: .o)]

    private var currentPlayer: Player

    init() {
        self.currentPlayer = players.first!
    }

    func play(position: Board.Position) throws {
        try board.play(position: position, marker: currentPlayer.marker)
        if board.isGameOver() {
            status = .playerWon(currentPlayer)
        } else if board.isDraw() {
            status = .draw
        }
        switchPlayers()
    }

    private func switchPlayers() {
        currentPlayer = currentPlayer == players.first ? players.last! : players.first!
    }
}
