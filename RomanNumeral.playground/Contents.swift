import UIKit


 
let string = "IV"
let stringDic = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

var arrStr = Array(string)
let subDic = arrStr.map { stringDic[(String($0))]! }
var newDic = [Int]()


for i in 0...subDic.count - 1{
    if subDic.count == 1{
        newDic.append(subDic[i])
    }
    else if (i + 1) < subDic.count && subDic[i] <  subDic[i + 1]{
        newDic.append(subDic[i + 1] - subDic[i])
    }else{
        newDic.append(subDic[i])
    }
}




var filteredNumbers = newDic.indices.map { i in i > 0 && newDic[i] - newDic[i-1] > 1 ? 0 : newDic[i] }


if filteredNumbers.count > 2 && filteredNumbers[filteredNumbers.count - 2] < filteredNumbers[filteredNumbers.count - 1]{
    filteredNumbers = filteredNumbers.dropLast()
} else if filteredNumbers.count == 2 && filteredNumbers[1] > filteredNumbers[0]{
    filteredNumbers = filteredNumbers.dropLast()
}



print(subDic)
print(newDic)
print(filteredNumbers)
print(filteredNumbers.reduce(0,+))
