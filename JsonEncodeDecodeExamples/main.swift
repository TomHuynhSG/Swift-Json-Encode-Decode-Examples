//
//  main.swift
//  JsonEncodeDecodeExamples
//
//  Created by Tom Huynh on 7/21/22.
//

import Foundation

struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    var email: String
    var phone: String
    var imageName: String
}

// Examples

// Orginal Struct Example
var arrayContactStructExample =
[
    Contact(name: "Tom Huynh", email: "tom.huynh@rmit.edu.vn", phone: "091232522", imageName: "tom-huynh"),
    Contact(name: "Brett Kirk", email: "brett.kirk@rmit.edu.vn", phone: "094355634", imageName: "brett-kirk"),
    Contact(name: "Minh Dinh", email: "minh.dinh4@rmit.edu.vn", phone: "0853453563", imageName: "minh-dinh"),
    Contact(name: "Tri Dang", email: "tri.dangtran@rmit.edu.vn", phone: "0674868566", imageName: "tri-dang"),
    Contact(name: "Long Nguyen", email: "long.nguyenminh@rmit.edu.vn", phone: "0962456754", imageName: "long-nguyen"),
    Contact(name: "Minh Vu", email: "minh.vu@rmit.edu.vn", phone: "0934634534", imageName: "minh-vu"),
    Contact(name: "Linh Tran", email: "linh.tranduc@rmit.edu.vn", phone: "095463745", imageName: "linh-tran"),
    Contact(name: "Alberto", email: "alberto@rmit.edu.vn", phone: "094354456", imageName: "alberto"),
    Contact(name: "Cuong Nguyen", email: "cuong.nguyen@rmit.edu.vn", phone: "0922342355", imageName: "cuong-nguyen"),
    Contact(name: "Khuong Nguyen", email: "khuong.nguyen@rmit.edu.vn", phone: "09453346323", imageName: "khuong-nguyen"),
    Contact(name: "Luan Nguyen", email: "luan.nguyen@rmit.edu.vn", phone: "0925342356", imageName: "luan-nguyen"),
    Contact(name: "Minh Tran", email: "minh.tran@rmit.edu.vn", phone: "0952534523", imageName: "minh-tran"),
    Contact(name: "Sam Goundar", email: "sam.goundar@rmit.edu.vn", phone: "095534534", imageName: "sam-goundar"),
    Contact(name: "Ushik Shrestha", email: "ushik.shrestha@rmit.edu.vn", phone: "0922345123", imageName: "ushik-shrestha")
]

// Json String Example
var contactJsonStringExample = """
[{"email":"tom.huynh@rmit.edu.vn","id":"69822D24-DB5E-443F-83B1-608E071BB6B3","phone":"091232522","imageName":"tom-huynh","name":"Tom Huynh"},{"email":"brett.kirk@rmit.edu.vn","id":"94F42BE8-E122-4C86-BAD5-1D8D973CE7EC","phone":"094355634","imageName":"brett-kirk","name":"Brett Kirk"},{"email":"minh.dinh4@rmit.edu.vn","id":"F81D9BD1-9B1C-4044-B319-C27752FFC698","phone":"0853453563","imageName":"minh-dinh","name":"Minh Dinh"},{"email":"tri.dangtran@rmit.edu.vn","id":"A52A4A41-A8A9-45E5-86B8-1E4EBF2F041A","phone":"0674868566","imageName":"tri-dang","name":"Tri Dang"},{"email":"long.nguyenminh@rmit.edu.vn","id":"B477621B-58B8-4C15-95F2-9834843D47C4","phone":"0962456754","imageName":"long-nguyen","name":"Long Nguyen"},{"email":"minh.vu@rmit.edu.vn","id":"4125C88A-3848-4970-8E8B-837A46A58468","phone":"0934634534","imageName":"minh-vu","name":"Minh Vu"},{"email":"linh.tranduc@rmit.edu.vn","id":"09D56B0C-21CB-4C75-AB41-3DA0C338746F","phone":"095463745","imageName":"linh-tran","name":"Linh Tran"},{"email":"alberto@rmit.edu.vn","id":"BC83F71B-D785-47E0-9597-E4360294CCD9","phone":"094354456","imageName":"alberto","name":"Alberto"},{"email":"cuong.nguyen@rmit.edu.vn","id":"5457E3F2-743D-4B17-B017-EE85EA37D845","phone":"0922342355","imageName":"cuong-nguyen","name":"Cuong Nguyen"},{"email":"khuong.nguyen@rmit.edu.vn","id":"229F2B9A-D4C3-4AA9-8EED-C187E0E0D9B8","phone":"09453346323","imageName":"khuong-nguyen","name":"Khuong Nguyen"},{"email":"luan.nguyen@rmit.edu.vn","id":"F40BECE6-000C-4459-8838-C19C3941FAFE","phone":"0925342356","imageName":"luan-nguyen","name":"Luan Nguyen"},{"email":"minh.tran@rmit.edu.vn","id":"0A8CF7ED-0F80-4058-A5D6-516F4C401846","phone":"0952534523","imageName":"minh-tran","name":"Minh Tran"},{"email":"sam.goundar@rmit.edu.vn","id":"54DE0FBE-962B-46FA-986E-A332498F7677","phone":"095534534","imageName":"sam-goundar","name":"Sam Goundar"},{"email":"ushik.shrestha@rmit.edu.vn","id":"213F280C-E610-4F91-A504-C8B461FB74C7","phone":"0922345123","imageName":"ushik-shrestha","name":"Ushik Shrestha"}]
"""

// Json String Example
var contactJsonFileURLExample = "https://jsonkeeper.com/b/Z0N2"


// How to encode an array of struct into a json string
func encodeStructToJsonString(inputContacts: [Contact]) -> String{
    do {
       let data = try JSONEncoder().encode(inputContacts)
       // Print the encoded JSON data
       if let jsonString = String(data: data, encoding: .utf8) {
           return jsonString
       }
    } catch let err {
        fatalError("Failed to encode JSON: \(err)")
    }
    return ""
}
print("How to encode an array of struct into a json string:")
print(encodeStructToJsonString(inputContacts: arrayContactStructExample))
print("----------------------------------------------------\n")
      

// How to decode a json string into an array of struct
func decoceJsonStringToStruct(inputJsonString: String) -> [Contact]{
    let contactData = Data(inputJsonString.utf8)
    
    do {
        let decoded = try JSONDecoder().decode([Contact].self, from: contactData)
        return decoded
    } catch let err {
        fatalError("Failed to encode JSON: \(err)")
    }
    
    return [] as [Contact]
}

print("How to decode a json string into an array of struct:")
var exampleStructA = decoceJsonStringToStruct(inputJsonString: contactJsonStringExample)
print(exampleStructA)
print(type(of: exampleStructA))
print("----------------------------------------------------\n")
      

// How to decode a json file URL into an array of struct
func decoceJsonFileToStruct(jsonURL: String) -> [Contact]{

    if let url = URL(string: jsonURL) {
        if let data = try? Data(contentsOf: url) {
            do {
                let decoded = try JSONDecoder().decode([Contact].self, from: data)
                return decoded
            } catch let err {
                fatalError("Failed to encode JSON: \(err)")
            }
        }
    }
    return [] as [Contact]
}

print("How to decode a json file URL into an array of struct:")
var exampleStructB = decoceJsonFileToStruct(jsonURL: contactJsonFileURLExample)
print(exampleStructB)
print(type(of: exampleStructB))
print("----------------------------------------------------\n")
