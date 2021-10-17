import Foundation

class Game
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    {
        get
        {
            var foundIndex: Int?
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex == nil { foundIndex = index }
                    else { return nil }
                }
            }
            return foundIndex
        }
        set
        {
            for index in cards.indices
            {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            // optional binding
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index
            {
                if cards[matchingIndex].identyfier == cards[index].identyfier
                {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
            }
            else
            {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            
            cards += [card, card]
        }
    }
}
