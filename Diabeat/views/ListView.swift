//
//  ListView.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 07/11/2022.
//

import Foundation
import SwiftUI

struct ListView: View {
    @ObservedObject var model : CRUDViewModel = CRUDViewModel.getInstance()

     var body: some View
     { List(model.currentClassifications)
       { instance in ListRowView(instance: instance) }.onAppear(perform: { model.listClassification() })
     }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(model: CRUDViewModel.getInstance())
    }
}
