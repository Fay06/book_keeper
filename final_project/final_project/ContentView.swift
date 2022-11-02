import SwiftUI


extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ContentView: View {
    
    @EnvironmentObject private var bookkeeper: Bookkeeper
    
    @State var money: Double = 0.00
    @State var note = ""
    @State var category = 0
    @State var isEarning = false
    @State var month = 0
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let categories = ["Food", "Cloth", "Transportation", "Housing", "Entertainment"]
    let earn_categories = ["Salary", "Bonus", "Investment"]
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    
                    Text("BOOKKEEPER").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.gray).offset(y:-40)
                    
                    Picker(selection: $isEarning, label: Text("Type")
                            .font(.body)) {
                        Text("Spending").font(.body).tag(false)
                        Text("Earning").font(.body).tag(true)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding().offset(y:-40)
                    
                    VStack{
                        if (isEarning){
                            Text("Earning ").font(.title).fontWeight(.bold).foregroundColor(Color.red).italic().padding(.bottom).offset(y:-50)
                        } else {
                            Text("Spending ").font(.title).fontWeight(.bold).foregroundColor(Color.green).italic().padding(.bottom).offset(y:-50)
                        }
                        
                        HStack{
                            Text("Amount: ").font(.headline).italic().padding(.leading)
                            TextField("$", value: $money, formatter: NumberFormatter.currency)
                        }.offset(y:-50)
                        
                        HStack{
                            Text("Note: ").font(.headline).italic().padding(.leading)
                            TextField("Note", text: $note)
                        }.offset(y:-50)
                        
                        
                        VStack{
                            if(isEarning == false){
                                Text("Category: ").font(.headline).italic().offset(x:-140)
                                Picker(selection: $category, label: Text("Category")
                                        .font(.body)) {
                                    ForEach(0 ..< categories.count) { index in
                                        Text(self.categories[index]).tag(index)
                                    }
                                }.frame(width: 10, height: 150, alignment: .center)
                            } else {
                                Text("Category: ").font(.headline).italic().offset(x:-140)
                                Picker(selection: $category, label: Text("Category")
                                        .font(.body)) {
                                    ForEach(0 ..< earn_categories.count) { index in
                                        Text(self.earn_categories[index]).tag(index)
                                    }
                                }.frame(width: 10, height: 150, alignment: .center)
                            }
                        }.offset(y:-50)
                        
                        VStack{
                            Text("Date: ").font(.headline).italic().offset(x:-155)
                            Picker(selection: $month, label: Text("Date")
                                    .font(.body)) {
                                ForEach(0 ..< months.count) { index in
                                    Text(self.months[index]).tag(index)
                                }
                            }.frame(width: 10, height: 150, alignment: .center)
                        }.offset(y:-50)
                        
                        Button(action: {
                            if (isEarning == false) {
                                bookkeeper.spending(cost: money)
                                bookkeeper.hash[month][categories[category]] = bookkeeper.hash[month][categories[category]]! + money
                                bookkeeper.report[months[month]] = bookkeeper.report[months[month]]! + money
                            } else {
                                bookkeeper.earning(money: money)
                            }
                            bookkeeper.addTranscation(Transcation(money, note, categories[category], isEarning, months[month]))
                        }, label: {
                            if (isEarning) {
                                Text("Submit").bold().colorMultiply(.black).background(Color.red)
                            } else {
                                Text("Submit").bold().colorMultiply(.black).background(Color.green)
                            }
                        }).offset(y:-50)
                        
                        Text("Your current balance: $\(bookkeeper.balanceFormat())")
                            .font(.title2).fontWeight(.heavy).foregroundColor(Color.blue).offset(y:-40)
                    }
                    
                    
                }
                
            }.background (
                Image("Background").resizable()
                    .scaledToFill().ignoresSafeArea()
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Bookkeeper())
    }
}
