final class Board: CustomStringConvertible {

    private var playedPositions: [Int: String] = [1: " ",
                                                  2: " ",
                                                  3: " ",
                                                  4: " ",
                                                  5: " ",
                                                  6: " ",
                                                  7: " ",
                                                  8: " ",
                                                  9: " "]

    var description: String {
        """
-------------
| \(playedPositions[1]!) | \(playedPositions[2]!) | \(playedPositions[3]!) |
| \(playedPositions[4]!) | \(playedPositions[5]!) | \(playedPositions[6]!) |
| \(playedPositions[7]!) | \(playedPositions[8]!) | \(playedPositions[9]!) |
-------------
"""
    }

    func play(position: Int, marker: String) {
        playedPositions[position] = marker
    }

    func isGameOver() -> Bool {
        isTopRowWin()
    }

    private func isTopRowWin() -> Bool {
        return playedPositions[1] == playedPositions[2] && playedPositions[1] == playedPositions[3]
    }
}
