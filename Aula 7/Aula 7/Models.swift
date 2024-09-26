//
//  API.swift
//  Aula 7
//
//  Created by Turma01-3 on 26/09/24.
//

import Foundation

struct Character: Codable, Identifiable {
let id: String
let name: String?
let alternate_names: [String]?
let species: String?
let gender: String?
let house: String?
let dateOfBirth: String?
let yearOfBirth: Int?
let wizard: Bool?
let ancestry: String?
let eyeColour: String?
let hairColour: String?
let wand: Wand
let patronus: String?
let hogwartsStudent: Bool?
let hogwartsStaff: Bool?
let actor: String?
let alternate_actors: [String]?
let alive: Bool?
let image: String?
}
struct Wand: Codable {
let wood: String?
let core: String?
let length: Double?
}
struct Spell {
    let id: String
    let name: String
    let description: String
}
