//
//  MainTabView.swift
//  Cookcademy
//
//  Created by specktro on 05/11/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            
            NavigationView {
                RecipesListView(category: .breakfast)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
        .environmentObject(recipeData)
    }
}

#Preview {
    MainTabView()
}