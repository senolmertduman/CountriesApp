//
//  Countries.swift
//  CountriesApp
//
//  Created by Şenol Mert Duman on 15.07.2023.
//

import Foundation

class Countries{
    var country_id:Int?
    var country_name:String?
    var country_image:String?
    init(){
        
    }
    init(country_id:Int, country_name:String, country_image:String) {
        self.country_id = country_id
        self.country_name = country_name
        self.country_image = country_image
    }
}
