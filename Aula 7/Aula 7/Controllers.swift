//
//  Controllers.swift
//  Aula 7
//
//  Created by Turma01-3 on 26/09/24.
//

import Foundation




//• all characters:
//• https://hp-api.onrender.com/api/characters
//• a specific character, based on their unique ID:
//• https://hp-api.onrender.com/api/character/:id
//• characters who are Hogwarts students during the book series:
//• https://hp-api.onrender.com/api/characters/students
//• characters who are Hogwarts staff during the book series:
//• https://hp-api.onrender.com/api/characters/staff
//• characters in a certain house, e.g. /gryffindor:
//• https://hp-api.onrender.com/api/characters/house/:house
//• all spells:
//• https://hp-api.onrender.com/api/spells

//func fetchFilms(completionHandler: @escaping ([Film]) -> Void) {
//    let url = URL(string: domainUrlString + "films/")!
//
//    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//      if let error = error {
//        print("Erro ao obter os filmes: \(error)")
//        return
//      }
//      
//      guard let httpResponse = response as? HTTPURLResponse,
//            (200...299).contains(httpResponse.statusCode) else {
//        print("Erro na resposta. Código de status esperado: \(response)")
//        return
//      }
//
//      if let data = data,
//        let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
//        completionHandler(filmSummary.results ?? [])
//      }
//    })
//    task.resume()
//  }
let domainUrlString = "https://hp-api.onrender.com/api/"

import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchAllCharacters() {
        let domainUrlString = "https://hp-api.onrender.com/api/" // Defina sua URL aqui
        let urlString = domainUrlString + "characters"
        
        guard let url = URL(string: urlString) else {
            print("URL inválida.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error in character fetch: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error in http response. Status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let characters = try JSONDecoder().decode([Character].self, from: data)
                    DispatchQueue.main.async {
                        self.characters = characters
                    }
                } catch {
                    print("Erro ao decodificar os dados: \(error)")
                }
            }
        }
        
        task.resume()
    }
}


func fetchAllCharacterById(id : Int) -> Character?{
    return nil
}

func fetchHogwartsStudents() -> [Character]{
    return []
}

func fetchHogeartsStaff() -> [Character]{
    return []
}

func fetchCharactersByHouse(house: String)-> [Character]{
    return[]
}

func fetchSpells() -> [Spell] {
    return []
}



