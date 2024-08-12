//
//  PokemonListModel.swift
//  MVVM-Architecture
//
//  Created by russel on 12/8/24.
//

import Foundation

struct PokemonListModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonList]
}

struct PokemonList: Codable, Equatable {
    let name: String
    let url: String
}
