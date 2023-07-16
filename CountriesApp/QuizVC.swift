//
//  QuizVC.swift
//  CountriesApp
//
//  Created by Şenol Mert Duman on 15.07.2023.
//

import UIKit

class QuizVC: UIViewController {
    
    var answerList = [Countries]() //Soru listesi
    var answer = "" //Cevap
    var correctCountry = Countries() //Dogru cevap
    var randomNum = Int.random(in: 0..<4)
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    var questionCount = 0
    var correct = 0
    var wrong = 0
    
    var questionsAskedId = [99,100] //Sorulmus sorular. Bu listenin bos olmamasi gerekli o yuzden veritabaninda olmayan id'ler yazdim
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    func nextQuestion(){
        //Her calistiginda soru sayisi 1 artsin
        questionCount += 1
        correctLabel.text = "Doğru: \(correct)"
        wrongLabel.text = "Yanlış: \(wrong)"
        questionLabel.text = "Soru: \(questionCount)"
        //Veritabanindan daha once sorulmamis rastgele 4 ulke al
        answerList = Countriesdao().randomCountry(idList: questionsAskedId)
        //Bu 4 ulkeden rastgele 1 tanesi dogru cevap olsun
        randomNum = Int.random(in: 0..<4)
        correctCountry = answerList[randomNum]
        //Sorulmus sorular listesine ekle birdaha sorulmasin
        questionsAskedId.append(correctCountry.country_id!)
        //Soru gorseli
        questionImage.image = UIImage(named: correctCountry.country_image!)
        //Secenekler
        answer1.setTitle("\(answerList[0].country_name!)", for: .normal)
        answer2.setTitle("\(answerList[1].country_name!)", for: .normal)
        answer3.setTitle("\(answerList[2].country_name!)", for: .normal)
        answer4.setTitle("\(answerList[3].country_name!)", for: .normal)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            //Sonuc ekranina sonuclari gonder
            let destinationVC = segue.destination as! ResultVC
            destinationVC.correctCount = correct
            destinationVC.wrongCount = wrong
        }
    }
    //SECENEKLER
    @IBAction func answer1Button(_ sender: Any) {
        //Butonun uzerindeki ulkeyi cevap degiskenine ata
        answer = (answer1.titleLabel?.text)!
        //Cevap dogru mu?
        if answer == correctCountry.country_name{
            correct += 1
        }else{
            wrong += 1
        }
        //5. soruyu cevaplayinca sonuc ekranina gec
        if questionCount == 5{
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        }else{
            nextQuestion()
        }
    }
    @IBAction func answer2Button(_ sender: Any) {
        answer = (answer2.titleLabel?.text)!
        if answer == correctCountry.country_name{
            correct += 1
        }else{
            wrong += 1
        }
        if questionCount == 5{
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        }else{
            nextQuestion()
        }
    }
    @IBAction func answer3Button(_ sender: Any) {
        answer = (answer3.titleLabel?.text)!
        if answer == correctCountry.country_name{
            correct += 1
        }else{
            wrong += 1
        }
        if questionCount == 5{
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        }else{
            nextQuestion()
        }
    }
    @IBAction func answer4Button(_ sender: Any) {
        answer = (answer4.titleLabel?.text)!
        if answer == correctCountry.country_name{
            correct += 1
        }else{
            wrong += 1
        }
        if questionCount == 5{
            self.performSegue(withIdentifier: "toResultVC", sender: nil)
        }else{
            nextQuestion()
        }
    }
}
