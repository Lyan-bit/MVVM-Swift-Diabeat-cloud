import Foundation
import Darwin

class ClassificationVO : Identifiable
{
    var id : String = UUID().uuidString /* principal key */
    var pregnancies: Float = 0
    var glucose: Float = 0
    var bloodPressure: Float = 0
    var skinThickness: Float = 0
    var insulin: Float = 0
    var bmi: Float = 0
    var diabetesPedigree: Float = 0
    var age: Float = 0
    var result: String = ""
    
    static var defaultInstance : ClassificationVO? = nil
    var errorlist : [String] = [String]()

  init() {
  //init
  }


  static func defaultClassificationVO() -> ClassificationVO
  { if defaultInstance == nil
    { defaultInstance = ClassificationVO() }
    return defaultInstance!
  }

    init(idx : String, pregnanciesx: Float, glucosex: Float, bloodPressurex: Float,
         skinThicknessx: Float, insulinx: Float, bmix: Float,
         diabetesPedigreex: Float, agex: Float, resultx: String)  {
        
        id = idx
        pregnancies = pregnanciesx
        glucose = glucosex
        bloodPressure = bloodPressurex
        skinThickness = skinThicknessx
        insulin = insulinx
        bmi = bmix
        diabetesPedigree = diabetesPedigreex
        age = agex
        result = resultx
    }
    
    init(x : Classification)  {
        
        id = x.id
        pregnancies = x.pregnancies
        glucose = x.glucose
        bloodPressure = x.bloodPressure
        skinThickness = x.skinThickness
        insulin = x.insulin
        bmi = x.bmi
        diabetesPedigree = x.diabetesPedigree
        age = x.age
        result = x.result
    }

    func toString() -> String {
        return "" + "id= " + id + ", " + "pregnancies= " + String(pregnancies)
                                + ", " + "glucose= " + String(glucose)
                                + ", " + "bloodPressure= " + String(bloodPressure)
                                + ", " + "skinThickness= " + String(skinThickness)
                                + ", " +  "insulin= " + String(insulin)
                                + ", " + "bmi= " + String(bmi)
                                + ", " + "diabetesPedigree= " + String(diabetesPedigree)
                                + ", " + "age= " + String(age)
                                + ", " + "result= " + result
    }
    
    func getid() -> String
    { return id }
    
    func getpregnancies() -> Float
    { return pregnancies }
    
    func getglucose() -> Float
    { return glucose }
    
    func getbloodPressure() -> Float
    { return bloodPressure }
    
    func getskinThickness() -> Float
    { return skinThickness }
    
    func getinsulin() -> Float
    { return insulin }
    
    func getbmi() -> Float
    { return bmi }
    
    func getdiabetesPedigree() -> Float
    { return diabetesPedigree }
    
    func getage() -> Float
    { return age }
    
    func getresult() -> String
    { return result }
    
    func setid(x : String)
    { id = x }
    
    func setpregnancies(x : Float)
    { pregnancies = x }
    
    func setglucose(x : Float)
    { glucose = x }
    
    func setbloodPressure(x : Float)
    { bloodPressure = x }
    
    func setskinThickness(x : Float)
    { skinThickness = x }
    
    func setinsulin(x : Float)
    { insulin = x }
    
    func setbmi(x : Float)
    { bmi = x }
    
    func setdiabetesPedigree(x : Float)
    { diabetesPedigree = x }
    
    func setage(x : Float)
    { age = x }
    
    func setresult(x : String)
    { result = x }

  func resetData()
  { errorlist = [String]() }

  func iscreateClassificationerror() -> Bool
  { resetData()
    return errorlist.count > 0
  }

  func iseditClassificationerror() -> Bool
  { return iscreateClassificationerror() }

  func islistClassificationerror() -> Bool
  { return false }

  func isdeleteClassificationerror() -> Bool
  { return false }

  func errors() -> String
  { var res : String = ""
    for (_,x) in errorlist.enumerated()
    { res = res + x + ", " }
    return res
  }
}


