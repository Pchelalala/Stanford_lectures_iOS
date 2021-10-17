import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identyfier: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int
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
