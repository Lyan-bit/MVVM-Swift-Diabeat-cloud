//
//  MainView.swift
//  Diet Pro
//
//  Created by Lyan Alwakeel on 26/09/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model : CRUDViewModel
    @ObservedObject var classificationvm : ClassificationViewModel
    
    var body: some View {
        TabView {
            CreateView(model: model)
                .tabItem{
                    Label("Create", systemImage: "square.and.pencil")
                }
            
            ListView(model: model)
                .tabItem{
                    Label("List", systemImage: "list.bullet.rectangle.portrait")
                }
            
            ClassifyView(model: model, classificationvm: classificationvm)
                .tabItem{
                    Label("Auto", systemImage: "barcode.viewfinder")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(model: CRUDViewModel.getInstance(), classificationvm: ClassificationViewModel.getInstance())
    }
}
