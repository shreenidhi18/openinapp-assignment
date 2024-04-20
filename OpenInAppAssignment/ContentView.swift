//
//  ContentView.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 31/03/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State var updateTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var greeting: String = ""
    @State var chartData: [ChartModel] = []
    var jsonHelper: JSONHelper = JSONHelper()
    
    @State var selectedTab: Int = 0
    
    
    var body: some View {
        GeometryReader { proxy in
            
            
            VStack{
                ScrollView(.vertical){
                    
                    Header(proxy: proxy)
                    
                    Main(greeting: $greeting)
                        .offset(y: -proxy.size.height / 18)
                    
                    VStack{
                        HStack {
                            Text("Overview")
                                .foregroundStyle(.gray)
                                .font(.custom("Figtree-Light", size: 20))
                            Spacer()
                        }
                        AnimatedChart()
                    }
                        .padding()
                        .background(.white,in: .rect(cornerRadius: 24))
                        .padding(.horizontal)
                        .offset(y: -proxy.size.height / 18)
                    
                    
                    HorizontalScrollPicker()
                        .offset(y: -proxy.size.height / 18)
                        .padding(.top)
                    
                    ViewAnalytics()
                        .padding(.top)
                        .offset(y: -proxy.size.height / 18)
                        .padding(.horizontal)
                        
                    TabButtons(selectedTab: $selectedTab)
                        .padding(.horizontal)
                    
                    
                }
                .ignoresSafeArea(edges: .top)
                .background(Color("mainColor"))
            }
            .onAppear {
           
                Task {
                    do{
                        let jsonString = try await jsonHelper.fetchDashboardData()
                        let data = try jsonHelper.extractDataField(from: jsonString)
                        let recentLinks = try jsonHelper.extractRecentLinks(from: data)
                        let topLinks = try jsonHelper.extractTopLinks(from: data)
                        let recentLinksArr = jsonHelper.decodeLinks(from: recentLinks)
                        let topLinkArr = jsonHelper.decodeLinks(from: topLinks)

                        if let recentLinksArray = recentLinksArr {
                            for link in recentLinksArray {
                                chartData.append(.init(creationDate: jsonHelper.convertISO8601StringToDate(link.createdAt) ?? Date(), totalClicks: link.totalClicks))
                            }
                        }
                        
//
                        
                        for chartDatum in chartData {
                            print(chartDatum)
                        }
                        
                        
                       
                        
                    }catch {
                        print("Error: \(error.localizedDescription)")
                    }

                }
                
            }
        }
        .onReceive(updateTimer, perform: { _ in
            greeting = getGreetingBasedOnTime()
        })
        
    }
    
    func getGreetingBasedOnTime() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            return "Good morning"
        case 12..<17:
            return "Good afternoon"
        case 17..<21:
            return "Good evening"
        default:
            return "Good night"
        }
    }
    
    @ViewBuilder
    func AnimatedChart() -> some View {
        Chart {
            ForEach(chartData) { item in
                
                LineMark(x: .value("Date", item.creationDate,unit: .month),
                         y: .value("Total Clicks", item.totalClicks))
                .interpolationMethod(.catmullRom)
   
            }
        }
        .frame(height: 200)
        .chartYScale(domain: 0...250)
        .chartYAxis {
            AxisMarks(preset: .extended, position: .leading)
        }
        
        
        
        
        
    }
    
}
    
    


struct ClickDataPoint: Identifiable {
    var id = UUID().uuidString
    
    var date: Date
    var totalClicks: Int
}



    
    


#Preview {
    ContentView()
}
