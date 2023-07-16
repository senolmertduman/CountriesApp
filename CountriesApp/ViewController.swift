//
//  ViewController.swift
//  CountriesApp
//
//  Created by Şenol Mert Duman on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        copyDatabase()
        /*
        Countriesdao().addCountry(country_name: "Almanya", country_image: "almanya")
        Countriesdao().addCountry(country_name: "Fransa", country_image: "fransa")
        Countriesdao().addCountry(country_name: "Turkiye", country_image: "Turkiye")
        Countriesdao().addCountry(country_name: "Ispanya", country_image: "ispanya")
        Countriesdao().addCountry(country_name: "Guney Kore", country_image: "guneykore")
        Countriesdao().addCountry(country_name: "Endonezya", country_image: "endonezya")
        Countriesdao().addCountry(country_name: "Danimarka", country_image: "danimarka")
        Countriesdao().addCountry(country_name: "Ingiltere", country_image: "ingiltere")
        Countriesdao().addCountry(country_name: "Avustralya", country_image: "avustralya")
        Countriesdao().addCountry(country_name: "Portekiz", country_image: "portekiz")
        Countriesdao().addCountry(country_name: "Rusya", country_image: "Rusya")
        Countriesdao().addCountry(country_name: "Norvec", country_image: "Norvec")
        Countriesdao().addCountry(country_name: "Meksika", country_image: "Meksika")
        Countriesdao().addCountry(country_name: "Luksemburg", country_image: "Luksemburg")
        Countriesdao().addCountry(country_name: "Italya", country_image: "Italya")
        Countriesdao().addCountry(country_name: "Isvec", country_image: "Isvec")
        Countriesdao().addCountry(country_name: "Hollanda", country_image: "Hollanda")
        Countriesdao().addCountry(country_name: "Finlandiya", country_image: "Finlandiya")
        Countriesdao().addCountry(country_name: "Brezilya", country_image: "Brezilya")
        Countriesdao().addCountry(country_name: "Belcika", country_image: "Belcika")
        Countriesdao().addCountry(country_name: "Arjantin", country_image: "Arjantin")
        Countriesdao().addCountry(country_name: "ABD", country_image: "ABD")
        Countriesdao().addCountry(country_name: "Azerbaycan", country_image: "Azerbaycan")
         */
        
        
    }

    //Veritabani kopyalama
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "Country", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("Country.sqlite")
        if fileManager.fileExists(atPath: placeToCopy.path){
            print("Veritabani zaten kopyalanmis")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            }catch{
                print(error)
            }
        }
    }
    @IBAction func playButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toQuizVC", sender: nil)
    }
}

