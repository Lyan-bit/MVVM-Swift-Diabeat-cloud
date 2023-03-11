import Foundation

class ClassificationBean
{
  var errorlist : [String] = [String]()

  init() {
  //init
  }

  func resetData()
  { errorlist = [String]() }

  func iscreateClassificationerror() -> Bool
  { resetData() 
    return errorlist.count > 0
  }

  func islistClassificationerror() -> Bool
  { resetData() 
    return false
  }

  func errors() -> String
  { var res : String = ""
    for (_,x) in errorlist.enumerated()
    { res = res + x + ", " }
    return res
  }

}

