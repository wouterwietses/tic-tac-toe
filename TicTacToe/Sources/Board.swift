final class Board: CustomStringConvertible {

    enum Error: Swift.Error {
        case positionAlreadyAssigned, gameIsOver
    }

    enum Marker: String {
        case empty = " "
        case x = "X",
             o = "O"
    }

    enum Position: Int {
        case one, two, three, four, five, six, seven, eight, nine
    }

    private var playedPositions: [Position: Marker] = [.one: .empty,
                                                       .two: .empty,
                                                       .three: .empty,
                                                       .four: .empty,
                                                       .five: .empty,
                                                       .six: .empty,
                                                       .seven: .empty,
                                                       .eight: .empty,
                                                       .nine: .empty]

    var description: String {
        """
-------------
| \(playedPositions[.one]!.rawValue) | \(playedPositions[.two]!.rawValue) | \(playedPositions[.three]!.rawValue) |
| \(playedPositions[.four]!.rawValue) | \(playedPositions[.five]!.rawValue) | \(playedPositions[.six]!.rawValue) |
| \(playedPositions[.seven]!.rawValue) | \(playedPositions[.eight]!.rawValue) | \(playedPositions[.nine]!.rawValue) |
-------------
"""
    }

    func play(position: Position, marker: Marker) throws {
        guard playedPositions[position] == .empty else { throw Error.positionAlreadyAssigned }

        guard !isGameOver() else { throw Error.gameIsOver }

        playedPositions[position] = marker
    }

    func isDraw() -> Bool {
        playedPositions.values.allSatisfy { $0 != .empty }
    }

    func isGameOver() -> Bool {
        isTopRowWin() || isMiddleRowWin()
    }

    private func isTopRowWin() -> Bool {
        return isEqualForWin(
            markerLhs: playedPositions[.one]!,
            markerRhs: playedPositions[.two]!
        ) && isEqualForWin(
            markerLhs: playedPositions[.one]!,
            markerRhs: playedPositions[.three]!
        )
    }

    private func isMiddleRowWin() -> Bool {
        return isEqualForWin(
            markerLhs: playedPositions[.four]!,
            markerRhs: playedPositions[.five]!
        ) && isEqualForWin(
            markerLhs: playedPositions[.four]!,
            markerRhs: playedPositions[.six]!
        )
    }

    private func isEqualForWin(markerLhs: Marker, markerRhs: Marker) -> Bool {
        guard markerLhs != .empty else { return false }

        return markerLhs == markerRhs
    }
}
