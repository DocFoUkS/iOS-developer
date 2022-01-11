import Foundation

extension StringProtocol  {
    var digits: [Int] {
        return compactMap{ $0.wholeNumberValue }
    }
}
extension LosslessStringConvertible {
    var string: String { return String(self) }
}
extension Int {
    var digits: [Int] {
        return string.digits
    }
}

// homework1
struct Person {
    var name: String
    var age: Int
    
    lazy var info: String = {
        switch self.age % 10 {
        case 1 where self.age % 100 != 11:
            return "\(self.name) \(self.age) год"
        case 2...4 where self.age % 100 < 12 || self.age % 100 > 14:
            return "\(self.name) \(self.age) года"
        default:
            return "\(self.name) \(self.age) лет"
        }
    }()
    
    func getAgeComparisonString(_ p: Person) -> String {
        if self.age < p.age {
            return "\(p.name) старше меня"
        } else if self.age > p.age {
            return "\(p.name) младше меня"
        } else {
            return "\(p.name) такого же возраста, как я"
        }
    }
    
    init (_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
}

var p1 = Person("Антон", 114)
var p2 = Person("Андрей", 36)
var p3 = Person("Ольга", 24)

print(p1.getAgeComparisonString(p2))
print(p2.getAgeComparisonString(p1))
print(p1.getAgeComparisonString(p3))


//homework2
print(p1.info)
print(p2.info)
print(p3.info)


//homework3
class Hero {
    private var lifeCount: Int
    
    func hit() {
        self.lifeCount -= 1
    }
    
    func isLive() -> Bool {
        return self.lifeCount > 0
    }
    
    init (lifeCount: Int) {
        self.lifeCount = lifeCount
    }
}

let hero = Hero(lifeCount: 2)

hero.hit()
hero.hit()
hero.hit()
hero.hit()

hero.isLive()

//homework6
class SuperHero: Hero {
    
    override func hit() {
        
    }
}

let superhero = SuperHero(lifeCount: 3)

superhero.hit()
superhero.isLive()
superhero.hit()
superhero.isLive()
superhero.hit()
superhero.isLive()
superhero.hit()
superhero.isLive()
superhero.hit()
superhero.isLive()
superhero.hit()
superhero.isLive()
