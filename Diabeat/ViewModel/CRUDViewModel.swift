//
//  ClassificationViewModel.swift
//  Diet Pro
//
//  Created by Lyan Alwakeel on 26/09/2022.
//

import Foundation
import Darwin
import Combine
import SwiftUI
import CoreLocation


/* This code requires OclFile.swift */

func initialiseOclFile()
{ createByPKOclFile(key: "System.in")
  createByPKOclFile(key: "System.out")
  createByPKOclFile(key: "System.err")
}


/* This metatype code requires OclType.swift */

func initialiseOclType()
{ let intOclType = createByPKOclType(key: "int")
  intOclType.actualMetatype = Int.self
  let doubleOclType = createByPKOclType(key: "double")
  doubleOclType.actualMetatype = Double.self
  let longOclType = createByPKOclType(key: "long")
  longOclType.actualMetatype = Int64.self
  let stringOclType = createByPKOclType(key: "String")
  stringOclType.actualMetatype = String.self
  let sequenceOclType = createByPKOclType(key: "Sequence")
  sequenceOclType.actualMetatype = type(of: [])
  let anyset : Set<AnyHashable> = Set<AnyHashable>()
  let setOclType = createByPKOclType(key: "Set")
  setOclType.actualMetatype = type(of: anyset)
  let mapOclType = createByPKOclType(key: "Map")
  mapOclType.actualMetatype = type(of: [:])
  let voidOclType = createByPKOclType(key: "void")
  voidOclType.actualMetatype = Void.self

  let classificationOclType = createByPKOclType(key: "Diabeat")
    classificationOclType.actualMetatype = Classification.self

    let classificationPregnancies = createOclAttribute()
        classificationPregnancies.name = "pregnancies"
        classificationPregnancies.type = stringOclType
        classificationOclType.attributes.append(classificationPregnancies)
    let classificationGlucose = createOclAttribute()
        classificationGlucose.name = "glucose"
        classificationGlucose.type = stringOclType
        classificationOclType.attributes.append(classificationGlucose)
    let classificationBloodPressure = createOclAttribute()
        classificationBloodPressure.name = "bloodPressure"
        classificationBloodPressure.type = intOclType
        classificationOclType.attributes.append(classificationBloodPressure)
    let classificationSkinThickness = createOclAttribute()
        classificationSkinThickness.name = "skinThickness"
        classificationSkinThickness.type = stringOclType
        classificationOclType.attributes.append(classificationSkinThickness)
    let classificationInsulin = createOclAttribute()
        classificationInsulin.name = "insulin"
        classificationInsulin.type = intOclType
        classificationOclType.attributes.append(classificationInsulin)
    let classificationBmi = createOclAttribute()
        classificationBmi.name = "bmi"
        classificationBmi.type = intOclType
        classificationOclType.attributes.append(classificationBmi)
    let classificationDiabetesPedigree = createOclAttribute()
        classificationDiabetesPedigree.name = "diabetesPedigree"
        classificationDiabetesPedigree.type = intOclType
        classificationOclType.attributes.append(classificationDiabetesPedigree)
    let classificationAge = createOclAttribute()
        classificationAge.name = "age"
        classificationAge.type = stringOclType
        classificationOclType.attributes.append(classificationAge)
    let classificationResult = createOclAttribute()
        classificationResult.name = "result"
        classificationResult.type = stringOclType
        classificationOclType.attributes.append(classificationResult)
    let classificationId = createOclAttribute()
        classificationId.name = "id"
        classificationId.type = stringOclType
        classificationOclType.attributes.append(classificationId)
}

func instanceFromJSON(typeName: String, json: String) -> AnyObject?
{ let jdata = json.data(using: .utf8)!
  let decoder = JSONDecoder()
  if typeName == "String"
  { let x = try? decoder.decode(String.self, from: jdata)
      return x as AnyObject
  }
  if typeName == "Classification"
    { let x = try? decoder.decode(Classification.self, from: jdata)
    return x
  }
  return nil
}


class CRUDViewModel : ObservableObject {
    static var instance : CRUDViewModel? = nil
    var fileSystem : FileAccessor = FileAccessor()
    var cdbi : FirebaseDbi = FirebaseDbi.getInstance()

  static func getInstance() -> CRUDViewModel
  { if instance == nil
    { instance = CRUDViewModel()
      initialiseOclFile()
      initialiseOclType()
    }
    return instance!
  }

  @Published var currentClassification : ClassificationVO = ClassificationVO.defaultClassificationVO()

  @Published var currentClassifications : [ClassificationVO] = [ClassificationVO]()

  init() { 
  //init
  }
    
    func listClassification() -> [ClassificationVO]
    {
      currentClassifications = [ClassificationVO]()
      let list : [Classification] = classificationAllInstances
      for (_,x) in list.enumerated()
      { currentClassifications.append(ClassificationVO(x: x)) }
      return currentClassifications
    }

  func stringListClassification() -> [String]
  { var res : [String] = [String]()
    for (_,obj) in currentClassifications.enumerated()
    { res.append(obj.toString()) }
    return res
  }

  func getClassificationByPK(val: String) -> Classification?
  { return Classification.classificationIndex[val] }

  func retrieveClassification(val: String) -> Classification?
  { return Classification.classificationIndex[val] }

  func allClassificationids() -> [String]
  { var res : [String] = [String]()
    for (_,item) in currentClassifications.enumerated()
    { res.append(item.id + "") }
    return res
  }

  func setSelectedClassification(x : ClassificationVO)
  { currentClassification = x }

  func setSelectedClassification(i : Int)
  { if i < currentClassifications.count
    { currentClassification = currentClassifications[i] }
  }

  func getSelectedClassification() -> ClassificationVO
  { return currentClassification }

  func persistClassification(x : Classification)
  { let vo : ClassificationVO = ClassificationVO(x: x)
    cdbi.persistClassification(ex: x)
    currentClassification = vo
  }

  func canceleditClassification() {
  //cancel
  }
  
  func editClassification(x : ClassificationVO)
  { if let obj = getClassificationByPK(val: x.id) {
      obj.pregnancies = x.getpregnancies()
      obj.glucose = x.getglucose()
      obj.bloodPressure = x.getbloodPressure()
      obj.skinThickness = x.getskinThickness()
      obj.insulin = x.getinsulin()
      obj.bmi = x.getbmi()
      obj.age = x.getage()
      obj.result = x.getresult()

      cdbi.persistClassification(ex: obj)
    }
    currentClassification = x
  }

  func cancelcreateClassification() {
  //cancel
  }
    
    func createClassification(x : ClassificationVO)
    { if let obj = getClassificationByPK(val: x.id)
        { cdbi.persistClassification(ex: obj) }
      else
     {
      let res : Classification = createByPKClassification(key: x.id)
          res.pregnancies = x.pregnancies
          res.glucose = x.glucose
          res.bloodPressure = x.bloodPressure
          res.skinThickness = x.skinThickness
          res.insulin = x.insulin
          res.bmi = x.bmi
          res.diabetesPedigree = x.diabetesPedigree
          res.age = x.age
          res.result = x.result
      cdbi.persistClassification(ex: res)
     }
     currentClassification = x
    }

  func deleteClassification(id : String)
  { if let obj = getClassificationByPK(val: id)
    { cdbi.deleteClassification(ex: obj) }
  }
    
}
