//
//  FruitModel.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/7/21.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    enum CodingKeys: String, CodingKey {
        case title, headline, image, description, gradientColors, nutrition
    }
    
    var id: UUID
    var title: String
    var headline: String
    var image: String
    var gradientColors: [String]
    var description: String
    var nutrition: [String]
}

extension Fruit: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = UUID()
        title = try values.decode(String.self, forKey: .title)
        headline = try values.decode(String.self, forKey: .headline)
        image = try values.decode(String.self, forKey: .image)
        gradientColors = try values.decode([String].self, forKey: .gradientColors)
        description = try values.decode(String.self, forKey: .description)
        nutrition = try values.decode([String].self, forKey: .nutrition)
    }
}

extension Fruit {
    func getColors() -> [Color] {
        return self.gradientColors.map{ Color($0)}
    }
}

extension Fruit {
    static let allFruits: [Fruit] = Bundle.main.decode("fruits.json")
    static let example: Fruit = allFruits[0]
}
