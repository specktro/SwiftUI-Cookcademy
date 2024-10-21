//
//  RecipeData.swift
//  Cookcademy
//
//  Created by specktro on 21/10/24.
//

import SwiftUI

final class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
