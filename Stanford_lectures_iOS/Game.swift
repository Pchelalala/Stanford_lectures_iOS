import Foundation

class Game
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    {
        get
        {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
//           return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
            
//            the same as previous 2 lines
//            var foundIndex: Int?
//            for index in cards.indices
//            {
//                if cards[index].isFaceUp
//                {
//                    if foundIndex == nil { foundIndex = index }
//                    else { return nil }
//                }
//            }
//            return foundIndex
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
                if cards[matchingIndex] == cards[index]
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
        assert(numberOfPairsOfCards > 0, "Game.init(\(numberOfPairsOfCards): must have at least one pair of cards!")
        
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            
            cards += [card, card]
        }
    }
}

extension Collection
{
    var oneAndOnly: Element?
    {
        return count == 1 ? first : nil
    }
}
