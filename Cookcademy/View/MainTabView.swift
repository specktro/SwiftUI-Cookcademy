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
                RecipesListView(viewStyle: .favorites)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

#Preview {
    MainTabView()
}
