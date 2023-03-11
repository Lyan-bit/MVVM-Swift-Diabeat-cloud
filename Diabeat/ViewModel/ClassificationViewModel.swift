//
//  classificationvm.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 08/11/2022.
//

import Foundation

class ClassificationViewModel: ObservableObject {
    static var instance : ClassificationViewModel? = nil
    private var crudvm : CRUDViewModel = CRUDViewModel.getInstance()
    private var modelParser : ModelParser? = ModelParser(modelFileInfo: ModelFile.modelInfo)
    
    static func getInstance() -> ClassificationViewModel
    { if instance == nil
      { instance = ClassificationViewModel()}
      return instance!
    }
    
    
    func classify(id : String) -> String{
        guard let obj = crudvm.getClassificationByPK(val: id)
        else {
            return "Please selsect valid id"
        }
        
        guard let result = self.modelParser?.runModel(
            withInput1: obj.pregnancies,
            withInput2: obj.glucose,
            withInput3: obj.bloodPressure,
            withInput4: obj.skinThickness,
            withInput5: obj.insulin,
            withInput6: obj.bmi,
            withInput7: obj.diabetesPedigree,
            withInput8: obj.age
        ) else{
            return "Error"
        }
        
        obj.result = result
        crudvm.persistClassification(x: obj)
        
        return result
    }
}
