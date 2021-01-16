//
//  DateExtension.swift
//  BayutTest
//
//  Created by sajeev Raj on 16/01/2021.
//  Copyright © 2021 BayutApp. All rights reserved.
//

import Foundation

extension String {
    
    func dateText(inputFormat: String, outputFormat: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inputFormat

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = outputFormat

        guard let date = dateFormatterGet.date(from: self) else { return "" }
        return dateFormatterPrint.string(from: date)
        
        
    }
    
    func getFormatedDate(output:String,dateFormat:String)-> String{

       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX")
       dateFormatter.dateFormat = dateFormat

       let dateFromInputString = dateFormatter.date(from: self)
       dateFormatter.dateFormat = output//"dd MMM yyyy" // Here you can use any dateformate for output date
       if(dateFromInputString != nil){
           return dateFormatter.string(from: dateFromInputString!)
       }
       else{
           debugPrint("could not convert date")
           return "N/A"
       }
   }
}
