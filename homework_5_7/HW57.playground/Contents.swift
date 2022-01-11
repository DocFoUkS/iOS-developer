import UIKit
import Foundation


func homework1 (_ int_mass: [Int]) -> Int {
    if int_mass.count == 0 {
        return 0
    } else if int_mass.count == 1{
        return int_mass[0]
    } else {
        return int_mass[0] + int_mass[1]
    }
}

homework1([])
homework1([5])


func homework2 (_ int_mass: [Int]) -> [Int]? {
    guard int_mass.count >= 2 else {
        return nil
    }
    return [int_mass[0], int_mass[int_mass.count - 1]]
}

homework2([])
homework2([4])
homework2([4, 8, 2])


// homework3
var filter_var: (Double) -> Bool = {$0 < 5}
var float_mass: [Double] = [1.5, 10, 4.99, 2.30, 8.19]
print(float_mass.filter(_ : filter_var))


//homework4
let dateformatter = DateFormatter()
dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
let date_mass: [Date] = [dateformatter.date(from: "2021-09-12 00:33:00")!, dateformatter.date(from: "2021-09-11 22:29:21")!]
print(date_mass)
var string_date: [String] = []
for element_date in date_mass {
    string_date.append(dateformatter.string(from: element_date))
}
print(string_date)


//homework5
print(date_mass.map({dateformatter.string(from: $0)}))


//homework6
let set_values1: Set = [5,7,8,9,11,13]
let set_values2: Set = [2,3,5,7]
print(set_values1.intersection(set_values2))
