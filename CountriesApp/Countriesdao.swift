//
//  Countriesdao.swift
//  CountriesApp
//
//  Created by Şenol Mert Duman on 15.07.2023.
//

import Foundation

class Countriesdao{
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseUrl = URL(filePath: targetPath).appendingPathComponent("Country.sqlite")
        db = FMDatabase(path: databaseUrl.path)
    }
    
    func addCountry(country_name:String,country_image:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO countries (country_name,country_image) VALUES (?,?)", values: [country_name,country_image])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func takeAllCountries() -> [Countries]{
        var list = [Countries]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM countries", values: nil)
            while rs.next(){
                let country = Countries(country_id: Int(rs.string(forColumn: "country_id"))!
                                        , country_name: rs.string(forColumn: "country_name")!
                                        , country_image: rs.string(forColumn: "country_image")!)
                    list.append(country)
                }
            }catch{
                print(error.localizedDescription)
        }
        db?.close()
        return list
    }
    func randomCountry(idList: [Int]) -> [Countries]{
        var liste = [Countries]()
        db?.open()
        do{
            let idListString = idList.map { String($0) }.joined(separator: ",")
            let rs = try db!.executeQuery("SELECT * FROM countries WHERE country_id NOT IN (\(idListString)) ORDER BY RANDOM() LIMIT 4", values: nil)
            while rs.next(){
                let country = Countries(country_id: Int(rs.string(forColumn: "country_id"))!
                                        , country_name: rs.string(forColumn: "country_name")!
                                        , country_image: rs.string(forColumn: "country_image")!)
                    liste.append(country)
                }
            }catch{
                print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
    
}
