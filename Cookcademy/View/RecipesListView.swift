//
//  RecipesListView.swift
//  Cookcademy
//
//  Created by specktro on 19/10/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var recipeData = RecipeData()
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipeData.recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle("All recipes")
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
}
