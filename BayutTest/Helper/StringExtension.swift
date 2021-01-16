//
//  DateExtension.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

extension String {
    func getFormatedDate(output:String,dateFormat:String)-> String{

       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX")
       dateFormatter.dateFormat = dateFormat

       let dateFromInputString = dateFormatter.date(from: self)
       dateFormatter.dateFormat = output
       if(dateFromInputString != nil){
           return dateFormatter.string(from: dateFromInputString!)
       }
       else{
           debugPrint("could not convert date")
           return "N/A"
       }
   }
}
