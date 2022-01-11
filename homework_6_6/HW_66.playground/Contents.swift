import UIKit
import Foundation


//homework1
var WeekDict: [String: Int] = [
    "Понедельник": 1,
    "Вторник": 2,
    "Среда": 3
]


//homework2
WeekDict["Четверг"] = 4


//homework3
for (key, value) in WeekDict {
    print("\(key) - \(value)")
}


//homework4
enum CustomError: Error, LocalizedError {
    case invalidPassword
    case notFound
    
    public var errorDescription: String? {
        switch self {
        case .invalidPassword:
            return "Неверный пароль"
        case .notFound:
            return "Не найдено"
        }
    }
}


//homework5
func throwsError (needsError: Bool) throws {
    if needsError {
        throw CustomError.notFound
    }
}


//homework6
do {
    try throwsError(needsError: true)
} catch {
    print(error.localizedDescription)
}
