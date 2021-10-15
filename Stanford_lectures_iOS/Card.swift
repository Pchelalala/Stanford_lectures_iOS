import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identyfier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int
    {
        identifierNumber += 1
        return identifierNumber
    }
    
    // initializer
    init()
    {
        self.identyfier = Card.identifierGenerator()
    }
}
