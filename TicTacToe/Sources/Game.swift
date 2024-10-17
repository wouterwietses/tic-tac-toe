final class Game {

    enum Status: Equatable {
        case inProgress
        case playerWon(Player)
    }

    let board: Board = Board()
    private(set) var status: Status = .inProgress

    private let players: [Player] = [Player(marker: "X"), Player(marker: "O")]

    private var currentPlayer: Player

    init() {
        self.currentPlayer = players.first!
    }

    func play(position: Int) {
        board.play(position: position, marker: currentPlayer.marker)
        switchPlayers()
        status = .playerWon(Player(marker: "X"))
    }

    private func switchPlayers() {
        currentPlayer = currentPlayer == players.first ? players.last! : players.first!
    }
}
