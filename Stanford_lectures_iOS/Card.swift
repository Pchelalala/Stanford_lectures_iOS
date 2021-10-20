import Foundation

struct Card: Hashable
{
    // func instead of hashValue (as it was shown in the 4th lecture)
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(identyfier)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool
    {
        return lhs.identyfier == rhs.identyfier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identyfier: Int
    
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
