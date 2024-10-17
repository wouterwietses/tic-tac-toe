final class Game {
    let board: Board = Board()

    func play(position: Int) {
        board.play(position: position, marker: "X")
    }
}
