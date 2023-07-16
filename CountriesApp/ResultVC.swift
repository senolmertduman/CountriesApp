//
//  ResultVC.swift
//  CountriesApp
//
//  Created by Şenol Mert Duman on 15.07.2023.
//

import UIKit

class ResultVC: UIViewController {
    @IBOutlet weak var correctImage: UIImageView!
    @IBOutlet weak var wrongImage: UIImageView!
    @IBOutlet weak var resultImage1: UIImageView!
    @IBOutlet weak var resultImage2: UIImageView!
    @IBOutlet weak var resultImage3: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var successLabel: UILabel!
    var correctCount = 0
    var wrongCount = 0
    var successPercent = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        successPercent = Int(Double(correctCount) / 5.0 * 100)
        resultLabel.text = "Doğru: \(correctCount)"
        wrongLabel.text = "Yanlış: \(wrongCount)"
        successLabel.text = "%\(successPercent) BAŞARI"
        if correctCount == 5{
            resultImage1.image = UIImage(named: "star")
            resultImage2.image = UIImage(named: "star")
            resultImage3.image = UIImage(named: "star")
        }else if correctCount == 4{
            resultImage1.image = UIImage(named: "star")
            resultImage2.image = UIImage(named: "star")
            resultImage3.image = UIImage(named: "star1")
        }else if correctCount == 3{
            resultImage1.image = UIImage(named: "star")
            resultImage2.image = UIImage(named: "star1")
            resultImage3.image = UIImage(named: "star1")
        }else{
            resultImage1.image = UIImage(named: "star1")
            resultImage2.image = UIImage(named: "star1")
            resultImage3.image = UIImage(named: "star1")
        }
        
    }
    
    

    @IBAction func replayButtonClicked(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
