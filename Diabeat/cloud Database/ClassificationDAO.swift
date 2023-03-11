import Foundation

class ClassificationDAO
{ static func getURL(command : String?, pars : [String], values : [String]) -> String
  { var res : String = "base url for the data source"
    if command != nil
    { res = res + command! }
    if pars.count == 0
    { return res }
    res = res + "?"
    for (i,v) in pars.enumerated()
    { res = res + v + "=" + values[i]
      if i < pars.count - 1
      { res = res + "&" }
    }
    return res
  }

  static func isCached(id : String) -> Bool
    { let x : Classification? = Diabeat.Classification.classificationIndex[id]
    if x == nil 
    { return false }
    return true
  }

  static func getCachedInstance(id : String) -> Classification
    { return Diabeat.Classification.classificationIndex[id]! }

  static func parseCSV(line: String) -> Classification?
  { if line.count == 0
    { return nil }
    let line1vals : [String] = Ocl.tokeniseCSV(line: line)
    var classificationx : Classification? = nil
      classificationx = Diabeat.Classification.classificationIndex[line1vals[0]]
    if classificationx == nil
    { classificationx = createByPKClassification(key: line1vals[0]) }
      classificationx!.pregnancies = Float(line1vals[0]) ?? 0
      classificationx!.glucose = Float(line1vals[1]) ?? 0
      classificationx!.bloodPressure = Float(line1vals[2]) ?? 0
      classificationx!.skinThickness = Float(line1vals[3]) ?? 0
      classificationx!.insulin = Float(line1vals[4]) ?? 0
      classificationx!.bmi = Float(line1vals[5]) ?? 0
      classificationx!.diabetesPedigree = Float(line1vals[6]) ?? 0
      classificationx!.age = Float(line1vals[7]) ?? 0
      classificationx!.result = line1vals[8]
      classificationx!.id = line1vals[9]
    return classificationx
  }

  static func parseJSON(obj : [String : AnyObject]?) -> Classification? {
    if let jsonObj = obj
    { let id : String? = jsonObj["id"] as! String?
      var classificationx : Classification? = Classification.classificationIndex[id!]
      if (classificationx == nil)
      { classificationx = createByPKClassification(key: id!) }
       
        if (classificationx !== nil) {
            classificationx!.pregnancies = jsonObj["pregnancies"] as! Float;
            classificationx!.glucose = jsonObj["glucose"] as! Float;
            classificationx!.bloodPressure = jsonObj["bloodPressure"] as! Float;
            classificationx!.skinThickness = jsonObj["skinThickness"] as! Float;
            classificationx!.insulin = jsonObj["insulin"] as! Float;
            classificationx!.bmi = jsonObj["bmi"] as! Float;
            classificationx!.diabetesPedigree = jsonObj["diabetesPedigree"] as! Float;
            classificationx!.age = jsonObj["age"] as! Float;
            classificationx!.result = jsonObj["result"] as! String;
            classificationx!.id = jsonObj["id"] as! String;
        }
      return classificationx!
    }
    return nil
  }

  static func writeJSON(x : Classification) -> NSDictionary
  { return [
       "pregnancies":  NSNumber(value: x.pregnancies),
       "glucose":  NSNumber(value: x.glucose),
       "bloodPressure": NSNumber(value: x.bloodPressure),
       "skinThickness":  NSNumber(value: x.skinThickness),
       "insulin": NSNumber(value: x.insulin),
       "bmi": NSNumber(value: x.bmi),
       "diabetesPedigree": NSNumber(value: x.diabetesPedigree),
       "age":  NSNumber(value: x.age),
       "result": x.result as NSString,
       "id": x.id as NSString      ]
  }

  static func makeFromCSV(lines: String) -> [Classification]
  { var res : [Classification] = [Classification]()

    if lines.count == 0
    { return res }

    let rows : [String] = Ocl.parseCSVtable(rows: lines)

    for (_,row) in rows.enumerated()
    { if row.count == 0 {
    //row
    }
      else
      { let x : Classification? = parseCSV(line: row)
        if (x != nil)
        { res.append(x!) }
      }
    }
    return res
  }
}
