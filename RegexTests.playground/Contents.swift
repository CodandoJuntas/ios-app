import UIKit
import Foundation

struct Category {
    
    var title: String = ""
    var description: String = ""
    var items: [Item] = []
    init() {}
    
}

struct Item {
    
    var title: String = ""
    var description: String = ""
    var link: String = ""
    init(){}
    
}

enum regexTags: String {

    case categories = "##[^#]+"
    case categoryTitle = "(?<=## ).+?(?=\n)"
    case categoryDescription = "(?<=\\*).+?(?=\\*)"
    case items = "(?<=\\* ).+?(?=\n)"
    case itemTitle = "(?<=\\[).+?(?=\\])"
    case itemLink = "(?<=\\().+?(?=\\))"
    case itemDescription = "(?<=\\- ).+?(?=$)"
}



func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
        let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

let data = Database.shared.loadData()

let categories = matches(for: regexTags.categories.rawValue, in: data)
categories.count


var categoriesList: [Category] = []

for category in categories {
    
    var cat = Category()
    
    cat.title = matches(for: regexTags.categoryTitle.rawValue, in: category).first ?? ""
    //print(cat.title)
    cat.description = matches(for: regexTags.categoryDescription.rawValue, in: category).first ?? ""
    let itemList = matches(for: regexTags.items.rawValue, in: category)
    
    for i in itemList {
        
        var item = Item()
        
        item.title = matches(for: regexTags.itemTitle.rawValue, in: i).first ?? ""
        item.description = matches(for: regexTags.itemDescription.rawValue, in: i).first ?? ""
        item.link = matches(for: regexTags.itemLink.rawValue, in: i).first ?? ""
        
        cat.items.append(item)
    }
    
    categoriesList.append(cat)
}

let cat = categoriesList[4]

print ("Titulo: \(cat.title) ")
print ("Descriçao: \(cat.description) ")
print ("LINKS: ")

for i in cat.items {
    
    print ("Titulo: \(i.title) ")
    print ("Descriçao: \(i.description) ")
    print ("LINK: \(i.link)")
    
}


