import UIKit
import Foundation


func homework1 (_ num1: Int, _ num2: Int) {
    if num1 == num2{
        print("Числа равны")
    } else if num1 > num2 {
        print("\(num1) больше \(num2)")
    } else {
        print("\(num1) меньше \(num2)")
    }
}

homework1(3, 2)


func homework2(_ num: String) -> Int {
    let integerNumber: Int! = Int(num)
    if integerNumber == nil {
        print("Ошибка")
        return -1
    } else if integerNumber > 100 {
        print("\(num) находится вне диапозона значений 1 ... 100")
    }
    return integerNumber
}

homework2("23hjsdfh234")


func findLargestNum(_ var_list: [Int]) -> Int? {
    guard var_list.isEmpty == false else {
        return nil
    }
    return var_list.max()
}

findLargestNum([1, 2, 5, 4])
findLargestNum([])

func findLargestNum2 (_ var_list: [Int]) -> Int? {
    guard var_list.isEmpty == false else {
        return nil
    }
    var max_num: Int = var_list[0]
    for element in var_list {
        if max_num < element {
            max_num = element
        }
    }
    return max_num
}

findLargestNum2([1, 2, 3, 5, 4])
findLargestNum2([])


func cube_faces(_ face: Int) {
    switch face {
    case 1 ... 3:
        print("Проигрыш")
    case 4 ... 6:
        print("Победа")
    default:
        print("У кубика только 6 граней!?")
    }
}

cube_faces(7)
