final class Board: CustomStringConvertible {

    enum Error: Swift.Error {
        case positionAlreadyAssigned, gameIsOver
    }

    enum Marker: String {
        case empty = " "
        case x = "X",
             o = "O"
    }

    private var playedPositions: [Int: Marker] = [1: .empty,
                                                  2: .empty,
                                                  3: .empty,
                                                  4: .empty,
                                                  5: .empty,
                                                  6: .empty,
                                                  7: .empty,
                                                  8: .empty,
                                                  9: .empty]

    var description: String {
        """
-------------
| \(playedPositions[1]!.rawValue) | \(playedPositions[2]!.rawValue) | \(playedPositions[3]!.rawValue) |
| \(playedPositions[4]!.rawValue) | \(playedPositions[5]!.rawValue) | \(playedPositions[6]!.rawValue) |
| \(playedPositions[7]!.rawValue) | \(playedPositions[8]!.rawValue) | \(playedPositions[9]!.rawValue) |
-------------
"""
    }

    func play(position: Int, marker: Marker) throws {
        guard playedPositions[position] == .empty else { throw Error.positionAlreadyAssigned }

        guard !isGameOver() else { throw Error.gameIsOver }

        playedPositions[position] = marker
    }

    func isDraw() -> Bool {
        playedPositions.values.allSatisfy { $0 != .empty }
    }

    func isGameOver() -> Bool {
        isTopRowWin()
    }

    private func isTopRowWin() -> Bool {
        return isEqualForWin(
            markerLhs: playedPositions[1]!,
            markerRhs: playedPositions[2]!
        ) && isEqualForWin(
            markerLhs: playedPositions[1]!,
            markerRhs: playedPositions[3]!
        )
    }

    private func isEqualForWin(markerLhs: Marker, markerRhs: Marker) -> Bool {
        guard markerLhs != .empty else { return false }

        return markerLhs == markerRhs
    }
}
