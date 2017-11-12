//
//  Engine.swift
//  travel plan
//
//  Created by Mathieu Janneau on 30/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit

/**
 This struct takes all the data input from the view and handle the
 */
public struct Engine {
  let destinations = [
    Destination("Cuba",200,"Eté","http://www.wendyperrin.com/wp-content/uploads/2016/04/vintage-cars-old-havana-cuba-cr-michael-petit.jpg"),
    Destination("Bali",500,"Eté","http://static.asiawebdirect.com/m/bangkok/portals/bali-indonesia-com/homepage/pagePropertiesImage/bali-guide.jpg"),
    Destination("Canada", 500,"Automne","http://www.cic.gc.ca/images/template/lp-visit.gif"),
    Destination("Londres", 200,"Automne","http://www.fr.lastminute.com/hotel/img/royaume-uni/londres.jpg"),
    Destination("Val d'Isere", 200, "Hiver","https://img2.onthesnow.com/image/gg/46/466261.jpg"),
    Destination("Tignes", 500, "Hiver","http://www.worldsnowboardguide.com//upload/images/all/PRCBXNGA.jpeg"),
    Destination("Tahiti", 500,"Printemps","http://www.orangesmile.com/ru/foto/Tahiti/Tahiti-b.jpg"),
    Destination("Rome", 100,"Printemps","https://upload.wikimedia.org/wikipedia/commons/d/d6/St_Peter%27s_Square%2C_Vatican_City_-_April_2007.jpg")
  ]
  
  /**
   Create a date from 3 integers day, month, year and format it.
   it uses gregorian calendar.
   - parameters:
   - day: Int
   - month: int
   - year: Int
   */
  func createDate(day:Int,month:Int,year:Int) -> Date{
    let userCalendar = Calendar.current
    var date = DateComponents()
    date.day = day
    date.month = month
    date.year = year
    let formattedDate = userCalendar.date(from: date)!
    return formattedDate
  }
  
  /**
   Create a season with a start and a end date for a range of year.
   it creates an array of Season object
   - parameters:
   - startYear: Int
   - endYear: Int
   */
  func generateAllSeasons (from startYear:Int, to endYear:Int) ->[Season]{
    var seasons = [Season]()
    
    for year in startYear...endYear{
      seasons.append(Season("Hiver", from:(01,01,year), to:(21,03,year)))
      seasons.append(Season("Printemps", from:(22,03,year), to:(21,06,year)))
      seasons.append(Season("Eté", from:(22,06,year), to:(21,09,year)))
      seasons.append(Season("Automne", from:(22,09,year), to:(21,12,year)))
      seasons.append(Season("Hiver", from:(22,12,year), to:(31,12,year)))
    }
    return seasons
  }
  /**
   Create image from string
   */
  func createThumbnails(from url: String) -> UIImage?{
    if let url = URL(string: url) {
      let data = try? Data(contentsOf: url)
      if let imageData = data {
        if let image = UIImage(data: imageData) {
          return image
        }
      }
    }
    return nil
    
  }
  /**
   Check in which period the date coosen by the user is part of
   */
  func seasonCheck(date: Date) -> String? {
    let seasons = generateAllSeasons(from: 2017, to: 2020)
    for season in seasons{
      var targetSeason:String
      if isInRange(date: date, of: season){
        targetSeason = season.name
        print("la saison choisie est \(targetSeason)")
        return targetSeason
      }
    }
    return nil
  }
  
  func priceCheck(price: Int, of destination: Destination) -> Bool{
    let range = 100
    if destination.price >= (price - range){
      if destination.price <= (price + range){
        return true
      }
    }
    return false
  }
  /**
   Check what are the destination available for the choosen period
   */
  func parsePossibleDestination(for period:String) -> Destination? {
    for destination in destinations {
      if destination.period == period {
        return destination
      }
    }
    return nil
  }
  
  /// fetch date from ViewController and compare it to the period.
  func compareData(date: Date, price: Int) -> (String, Int, UIImage?) {
    
    let period = seasonCheck(date: date)!
    let destination = parsePossibleDestination(for: period)!
    if priceCheck(price: price, of: destination){
      let result = (" \(destination.name)", destination.price, createThumbnails(from: destination.imageUrl))
      return result
    }
    else {
      let result = ("Désolé aucune destination disponible dans vos dates et votre budget",0,createThumbnails(from: destination.imageUrl))
      return result
    }
  }
  
  /// check if a date is in a range and return a bool
  func isInRange(date: Date, of season:Season) -> Bool{
    
    //checking if it the date is above the starting date
    if date.compare(season.startDate) == .orderedDescending || date.compare(season.startDate) == .orderedSame {
      //checking if it the date is below the ending date
      if date.compare(season.endDate) == .orderedAscending || date.compare(season.endDate) == .orderedSame{
        //date is in range
        return true
      }}
    
    //date is out of range
    return false
  }
  
}

