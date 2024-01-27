//
//  ModelData.swift
//  DagorMarket
//
//  Created by apple on 20.01.2024.
//

import Foundation


struct Section {
    let type: String
    let header: String
    let items: [Item]
}

struct Item {
    let name: String
    let photo: String
    let price: Double
    let description: String
    let quantity: Int
}

struct ModelData {
    static func getData() -> [Section] {
        
        let sectionOneItems = [
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
            Item(name: "Мед", photo: "img1", price: 9.5, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 1),
        ]
        
        let sectionSecondItems = [
            Item(name: "Мед", photo: "img1", price: 5.4, description: "Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh chopped. Spices – chili powder, cumin, onion powder.", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 10.4, description: "fsdafsaf", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 3000, description: "", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 0, description: "", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 3000, description: "", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 3000, description: "", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 3000, description: "", quantity: 0),
            Item(name: "Мед", photo: "img1", price: 3000, description: "", quantity: 0),
        ]
        
        let sectionOne = Section(type: "GroupComponents", header: "", items: sectionOneItems)
        let sectionSecond = Section(type: "", header: "", items: sectionSecondItems)
        
        return [sectionOne, sectionSecond]
    }
    
}

struct UserData{
    let name: String
    let photo: String
    let email: String
    let phoneNumber: String
    static func getData() -> UserData {
        UserData(name: "Гамзат", photo: "userAvatar", email: "@gamzat.com", phoneNumber: "8988-800-55-55")
    }
}
