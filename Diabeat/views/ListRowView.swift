//
//  BondListRowView.swift
//  bond
//
//  Created by Lyan Alwakeel on 10/09/1443 AH.
//

import SwiftUI

struct ListRowView: View {
    var instance : ClassificationVO
    @ObservedObject var model : CRUDViewModel = CRUDViewModel.getInstance()


      var body: some View
      { HStack {
          Text(String(instance.pregnancies)).bold()
          Text(String(instance.glucose))
          Text(String(instance.bloodPressure))
          Text(String(instance.skinThickness))
          Text(String(instance.insulin))
          Text(String(instance.bmi))
          Text(String(instance.diabetesPedigree))
          Text(String(instance.age))
          Text(String(instance.result))
        }.onTapGesture()
          { model.setSelectedClassification(x: instance) }
      }
    }

    struct ListRowView_Previews: PreviewProvider {
      static var previews: some View {
        ListRowView(instance: ClassificationVO(x: classificationAllInstances[0]))
      }
    }
