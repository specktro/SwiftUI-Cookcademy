//
//  RecipeData.swift
//  Cookcademy
//
//  Created by specktro on 21/10/24.
//

import SwiftUI

final class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    private var recipesFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        } catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        
        return filteredRecipes
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        
        return nil
    }
    
    func saveRecipes() {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(recipes)
            try encodedData.write(to: recipesFileURL)
        } catch {
            fatalError("An error occurred while saving the recipes: \(error)")
        }
    }
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        
        do {
            let decoder = JSONDecoder()
            let savedRecipes = try decoder.decode([Recipe].self, from: data)
            recipes = savedRecipes
        } catch {
            fatalError("An error occurred while loading the recipes: \(error)")
        }
    }
}
