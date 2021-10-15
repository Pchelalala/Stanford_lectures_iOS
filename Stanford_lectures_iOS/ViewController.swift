import UIKit

class ViewController: UIViewController
{
    // property observer
    var taps = 0
    {
        didSet
        {
            tapLabel.text = "Taps: \(taps)"
        }
    }

    func flipButton(emoji: String, button: UIButton)
    {
        if button.currentTitle == emoji
        {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.systemPink
        }
        else
        {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
    
    let emojiCollection = ["🧚🏻‍♀️", "🪄", "🧚🏻‍♀️", "🪄"]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var tapLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton)
    {
        taps += 1
        
        // optional binding
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

