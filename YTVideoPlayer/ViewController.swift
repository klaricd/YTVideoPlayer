//
//  ViewController.swift
//  YTVideoPlayer
//
//  Created by David Klaric on 23.10.2022..
//

import youtube_ios_player_helper
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var videoIDInfo: UIButton!
    @IBOutlet weak var randomVideoInfo: UIButton!
    
    @IBOutlet var playerView: YTPlayerView!
    @IBOutlet weak var videoIDText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: "")
        videoIDText.delegate = self
    }
    
    //MARK: buttons
    @IBAction func buttonPlaylistOne(_ sender: Any) {
        playerView.load(withPlaylistId: "PLlUZ3i-FUgHqk9-C-Fw_C6YsvTyx2c8nc")
    }
    
    @IBAction func buttonPlaylistTwo(_ sender: Any) {
        playerView.load(withPlaylistId: "PLOWSbqDrrI5QU6-kEuXq2eFqWZ3po6yHh")
    }
    
    @IBAction func buttonRandomVideo(_ sender: Any) {
        playerView.load(withVideoId: randomString(length: 11))
    }
    
    @IBAction func buttonSearchID(_ sender: Any) {
        let randomID = videoIDText.text
        playerView.load(withVideoId: randomID ?? "")
    }
    
    @IBAction func buttonInfo(_ sender: UIButton) {
        switch sender {
        case randomVideoInfo:
            // new alert
            let alert = UIAlertController(title: "Random video ID", message: "If you are lucky enough you will generate ID of existing Youtube video!", preferredStyle: .alert)
            
            // alert action
            let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in print("Ok button tapped")})
            
            // add action
            alert.addAction(ok)
            
            // present alert
            self.present(alert, animated: true, completion: nil)
        
        case videoIDInfo:
            // new alert
            let alert = UIAlertController(title: "Video ID", message: "Type random 11 characters ID and see if it turns out valid!", preferredStyle: .alert)
            
            // alert action
            let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in print("Ok button tapped")})
            
            // add action
            alert.addAction(ok)
            
            // present alert
            self.present(alert, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    
    //MARK: functions
    func randomString(length: Int) -> String {
        let letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= 11
    }
}

