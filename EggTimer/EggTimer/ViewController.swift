import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes: [String : Float] = ["Soft": 5, "Medium": 7 * 60, "Hard": 12 * 60]
    var timer = Timer()
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer?
    func playSound() {
        let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        let totalTime: Float = eggTimes[hardness]!
        var secondsPassed: Float = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed <= totalTime{
                let progressPercantage = secondsPassed / totalTime
                self.progressBar.progress = progressPercantage
                print(progressPercantage)
                secondsPassed += 1
                self.mainLabel.text = "Your \(sender.currentTitle!) Egg is Boiling!"
            } else {
                Timer.invalidate()
                self.mainLabel.text = "Your \(sender.currentTitle!) Egg is Done!"
                self.playSound()
            }
        }
    }
}

