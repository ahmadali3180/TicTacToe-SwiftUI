//
//  Cell.swift
//  TicTacToe-SwiftUI
//
//  Created by M. Ahmad Ali on 03/01/2023.
//

import Foundation
import UIKit
import SwiftUI

struct Cell {
    var tile: Tile
    
    func displayTitle() -> String {
        switch tile {
        case .Nought:
            return "O"
        case .Cross:
            return "X"
        default:
            return ""
        }
    }
    func tileColor() -> Color  {
        switch tile {
        case .Nought:
            return Color.red
        case .Cross:
            return Color.black
        default:
            return Color.black
        }
    }
}

enum Tile {
    case Nought
    case Cross
    case Empty
}
