//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by specktro on 19/10/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        List {
            ForEach(recipeData.recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle("All recipes")
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
}
