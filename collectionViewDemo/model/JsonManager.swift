//
//  JsonModel.swift
//  collectionViewDemo
//
//  Created by Dhaval Dobariya on 12/05/22.
//

import Foundation
struct JsonManager {
    func getUsersList() -> [DetailsModel]?{
        guard let path = Bundle.main.path(forResource: "JsonFile", ofType: "json") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
          
            do {
                let decodedOutput = try JSONDecoder().decode([DetailsModel].self, from: data)
               // print("decoded output is: \(decodedOutput)")
                return decodedOutput
            }catch {
                print("error is : \(error)")
                return nil
            }
            
        }catch {
            print(error)
            return nil
        }
        
    }
}
 

