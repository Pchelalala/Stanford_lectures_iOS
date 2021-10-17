import UIKit

class ViewController: UIViewController
{
    private lazy var game = Game(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int
    {
        return (buttonCollection.count + 1) / 2
    }
    
    // property observer
    private(set) var taps = 0
    {
        didSet
        {
            tapLabel.text = "Taps: \(taps)"
        }
    }

    private var emojiCollection = ["🐝", "🧚🏻‍♀️", "🪄", "🦋", "💫", "🔮", "🗝", "💸", "💎", "🩰", "🥥", "🦄"]
    
    private var emojiDictionary = [Int:String]()
    
    private func emojiIdentifier(for card: Card) -> String
    {
        if emojiDictionary[card.identyfier] == nil
        {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identyfier] = emojiCollection.remove(at: randomIndex)
            
        }
        
        // unwrapping optional
        /* if emojiDictionary[card.identyfier] != nil
        {
            return emojiDictionary[card.identyfier]!
        }
        else { return "?" } */
        
        // the same as previous commented lines
        return emojiDictionary[card.identyfier] ?? "?"
    }
    
    private func updateViewFromModel()
    {
        for index in buttonCollection.indices
        {
            let button = buttonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            }
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.systemPink
            }
        }
    }
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var tapLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton)
    {
        taps += 1
        
        // optional binding
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex)
            
            updateViewFromModel()
        }
    }
}

