import UIKit
import Foundation

// Задание 1. Сложение 2х Int чисел
func nextNumber(_ number: Int) -> Int {
    number + 1
}
nextNumber(2)

// Задание 2. Подсчет квадрата числа
func getSquare(_ number: Int) -> Int {
    number * number
}
let value = getSquare(3)

print(value)

// Задание 3. Подсчет минут и секунд в количестве секунд
func timeCounter(_ bigseconds: Int) -> (minutes: Int, seconds: Int) {
    (bigseconds/60, bigseconds % 60)
}
timeCounter(70)

// Задание 4. Сложение 2х строк
func plusString(_ word1: String, _ word2: String) -> String {
    word1 + word2
}
let string1 = "Writing Swift code "
let string2 = "is interactive and fun"
let bothstring: String = plusString(string1, string2)
print(bothstring)

// Задание 5. Преобразование строки в дату
func convertDate(_ datestring: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: datestring) ?? Date()
}
convertDate("2021-09-01")
