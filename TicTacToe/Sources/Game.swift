final class Game {
    let board: Board = Board()
    private let players: [Player] = [Player(marker: "X"), Player(marker: "O")]

    private var currentPlayer: Player

    init() {
        self.currentPlayer = players.first!
    }

    func play(position: Int) {
        board.play(position: position, marker: currentPlayer.marker)
        switchPlayers()
    }

    private func switchPlayers() {
        if currentPlayer == players.first! {
            currentPlayer = players.last!
        } else {
            currentPlayer = players.first!
        }
    }
}
