//
//  DBData.swift
//  CruiseApp
//
//  Created by Noah Gerberick on 3/16/19.
//  Copyright © 2019 Noah Gerberick. All rights reserved.
//

import UIKit

extension NSObject {
    func connectDatabase(url: String, postString: String, completion: @escaping (_ data: String) -> ()) {
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Status code should be 200 but is instead \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            let outputXML = String(data: data, encoding: .utf8)!
            completion(outputXML)
        }
        task.resume()
    }
}

extension StringProtocol where Index == String.Index {
    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound  ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}

// ######## get xml element by key name ########
extension String {
    func xml(key: String) -> [String] {
        var stringArr: [String] = []
        var subData = self
        while subData.contains("<\(key)>") && subData.contains("</\(key)>") {
            let startIndex = subData.index(subData.index(after: subData.index(of: "<\(key)>")!), offsetBy: key.count + 1)
            let endIndex = subData.index(before: subData.index(of: "</\(key)>")!)
            if startIndex.encodedOffset > endIndex.encodedOffset {
                stringArr.append("")
            } else {
                let newDat = String(subData[startIndex...endIndex])
                stringArr.append(newDat)
            }
            let newIndex = subData.index(endIndex, offsetBy: key.count + 3)
            subData = String(subData[newIndex..<subData.endIndex])
        }
        return stringArr
    }
    
    func xml(key: String) -> String {
        if self.contains("<\(key)>") && self.contains("</\(key)>") {
            let startIndex = self.index(self.index(after: self.index(of: "<\(key)>")!), offsetBy: key.count + 1)
            let endIndex = self.index(before: self.index(of: "</\(key)>")!)
            if startIndex.encodedOffset > endIndex.encodedOffset {
                return ""
            } else {
                return String(self[startIndex...endIndex])
            }
        }
        return ""
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var intValue: Int {
        return Int((self as NSString).intValue)
    }
}
