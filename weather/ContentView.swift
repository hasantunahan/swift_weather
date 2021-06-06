//
//  ContentView.swift
//  weather
//
//  Created by HasanTunahan on 6.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false;
    var body: some View {
        ZStack{
            ExtractedViewBacground(isNight: $isNight)
            VStack{
                ExtractedViewTopElements()
                Spacer()
                HStack(spacing:12){
                    ExtractedView(dailyName: "Mon", dailyWeatherIcon:  "cloud.sun.rain.fill", dailyWeatherTemparature: 23)
                    ExtractedView(dailyName: "Tue", dailyWeatherIcon:  "cloud.sun.rain.fill", dailyWeatherTemparature: 25)
                    ExtractedView(dailyName: "Wed", dailyWeatherIcon:  "cloud.bolt.rain.fill", dailyWeatherTemparature: 22)
                    ExtractedView(dailyName: "Thu", dailyWeatherIcon:  "cloud.rain.fill", dailyWeatherTemparature: 25)
                    ExtractedView(dailyName: "Fri", dailyWeatherIcon:  "cloud.sun.fill", dailyWeatherTemparature: 25)
                    ExtractedView(dailyName: "Sat", dailyWeatherIcon:  "sun.max.fill", dailyWeatherTemparature: 27)
                    ExtractedView(dailyName: "Sun", dailyWeatherIcon:  "sun.max.fill", dailyWeatherTemparature: 32)
                    
                }
                Spacer()
                Button{
                    isNight.toggle();
                }label:{
                    Text("Change Date Time")
                        .frame(width: 240, height: 50)
                        .foregroundColor(Color("appTopBlue"))
                        .background(Color.white)
                        .cornerRadius(10.0)
                    
                }
                Spacer()
            }
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ExtractedView: View {
    let dailyName : String;
    let dailyWeatherIcon :  String ;
    let dailyWeatherTemparature : Int;
    var body: some View {
        VStack{
            Text(dailyName)
                .foregroundColor(.white)
                .font(.system(size :16,weight: .heavy))
            Image(systemName: dailyWeatherIcon).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(dailyWeatherTemparature)°")
                .font(.system(size: 16,weight: .medium)).foregroundColor(.white)
        }
    }
}

struct ExtractedViewBacground: View {
    @Binding var isNight : Bool;
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? Color("nightBlue") : Color("appTopBlue"),isNight ? .black : Color("appBlue")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint:.bottomTrailing)
            .edgesIgnoringSafeArea( .all)
    }
}

struct ExtractedViewTopElements: View {
    var body: some View {
        VStack{
            Text("Weather App")
                .font(.system(size: 32,weight: .medium ))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            Image(systemName: "cloud.sun.rain.fill").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("26°")
                .font(.system(size: 70)).foregroundColor(.white)
        }
    }
}





