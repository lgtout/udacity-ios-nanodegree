//
//  ViewController.swift
//  Silly Song
//
//  Created by julian abiodun on 3/31/17.
//  Copyright © 2017 lagostout. All rights reserved.
//

import UIKit

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate,
                                        fullName: nameField.text!)
    }
    
}

func shortNameFromName(_ name: String) -> String {
    let name = name.lowercased()
    let cs = CharacterSet(charactersIn: "aeiou\u{00f6}")
    var shortName:String = name
    if let r = name.rangeOfCharacter(from: cs) {
        shortName = name.substring(from:(r.lowerBound))
    }
    return shortName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName:String) -> String {
    let lyrics =
        lyricsTemplate.replacingOccurrences(
            of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(
                of: "<SHORT_NAME>",
                with: shortNameFromName(fullName))
    return lyrics
}


