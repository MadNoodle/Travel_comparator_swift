//
//  Engine.swift
//  travel plan
//
//  Created by Mathieu Janneau on 30/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation

/**
 This struct takes all the data input from the view and handle the 
 */
public struct Engine {
  
 
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
      seasons.append(Season("Printemps", from:(22,03,year), to:(21,06,year)))
      seasons.append(Season("Eté", from:(22,06,year), to:(21,09,year)))
      seasons.append(Season("Automne", from:(22,09,year), to:(21,12,year)))
      seasons.append(Season("Hiver", from:(22,12,year), to:(21,03,year)))
    }
    return seasons
  }
  
  /// fetch date from ViewController and compare it to the period.
  func compareData(date: Date, price: Int){
    let seasons = generateAllSeasons(from: 2017, to: 2020)
    
    for season in seasons{
      if isInRange(date: date, of: season){
        print("la saison est \(season.name)")
      }
    }
    
    print("Your date is : \(date)")
    print("Your price is \(price)")
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
