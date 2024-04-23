import SwiftUI

//extensions for Dictionary to provide URL encoding functionality
extension Dictionary where Key == String, Value == String
{
    func urlEncoded() -> String 
    {
        return self.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

//listed ingredients
struct FrontPage: View
{
    let veggies = ["Asparagus", "Avocado", "Beets", "Broccoli", "Cabbage", "Carrots", "Cauliflower", "Celery", "Corn", "Cucumbers", "Garlic", "Green Beans", "Red Onion", "Collard Greens", "Kale", "Lettuce", "Mushrooms", "Onions", "Peas", "Sweet Peppers", "Potatoes", "Spinach", "Squash", "Tomatoes", "Bell Pepper", "Jalapeno"].sorted()
    let fruits = ["Apples", "Banana", "Blackberry", "Blueberry", "Cherry", "Grapes", "Kiwi", "Lemon", "Lime", "Mandarin", "Orange", "Pear", "Pineapple", "Plum", "Raspberries", "Strawberry", "Watermelon"].sorted()
    let grains = ["Buckwheat", "Rice", "Rye", "Sorghum", "Wheat", "Wild Rice"].sorted()
    let protein = ["Chicken", "Turkey", "Beef", "Pork", "Ground Beef", "Tilapia", "Salmon", "Shrimp", "Tofu", "Lobster", "Crab", "Octopus", ].sorted()
    let dairy = ["Milk","Eggs", "Yogurt", "Cheese", "Sour Cream", "Cottage Cheese", "Butter"].sorted()
    let other = ["Sugar", "Flour", "Corn Mix", "Flour Tortillias", "Corn Tortillias", ].sorted()
    let seasonings = ["Garlic Powder", "Onion Powder", "Chilli Powder", "Salt", "Black Pepper", "Sea Salt", "Paparika", "Smoked Paparika", "Cumin", "Coriandor", "Basil", "Oregano", "Cayenae Pepper", "Lemon Pepper", "Taco Seasoning", "Cajun seasoning", "Seasoned Salt"].sorted()
    let dietaryRestrictions = ["Vegetarian", "Vegan", "Gluten-Free", "Dairy-Free"].sorted()
    
    
    @State private var selectedOptions: Set<String> = []
    @State private var recipes: [Recipe] = []
    @State private var showRecipeResults = false
    @State private var selectedDietaryRestrictions: Set<String> = []
    
    var body: some View 
    {
        NavigationStack 
        {
            VStack 
            {
                Text("Cooking Just Got A Little More Creative!")
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.custom("DancingScript-Bold", size: 22))
                
                Text("What are you craving today?")
                    .foregroundColor(.white)
                    . bold()
                
                //user able to select desired ingredients in each category
                List 
                {
                    Section(header: HeaderView(title: "Protein", color: .EUorange))
                    {
                        ForEach(protein, id: \.self) 
                        { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Vegetables and Greens", color: .EUorange))
                    {
                        ForEach(veggies, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Grains", color: .EUorange))
                    {
                        ForEach(grains, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header: HeaderView(title: "Fruits", color: .EUorange))
                    {
                        ForEach(fruits, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Dairy", color: .EUorange))
                    {
                        ForEach(dairy, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Other", color: .EUorange))
                    {
                        ForEach(other, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Seasonings", color: .EUyellow))
                    {
                        ForEach(seasonings, id: \.self) { option in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(option) },
                                set: { if $0 { self.selectedOptions.insert(option) } else { self.selectedOptions.remove(option) } }
                            )) {
                                Text(option)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                    
                    Section(header:HeaderView(title: "Dietary Restrictions", color: .EUorange))
                    {
                        ForEach(dietaryRestrictions, id: \.self) { restriction in
                            Toggle(isOn: Binding<Bool>(
                                get: { self.selectedOptions.contains(restriction) },
                                set: { if $0 { self.selectedOptions.insert(restriction) } else { self.selectedOptions.remove(restriction) } }
                            )) {
                                Text(restriction)
                            }
                            .padding()
                        }
                    }
                    .background(Color.EUyellow)
                }
                .listStyle(GroupedListStyle())
                
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    fetchRecipes()
                }) {
                    Text("Let's Cook!")
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.EUyellow)
                        .cornerRadius(10)
                }

                .foregroundColor(.white)
                .navigationDestination(isPresented: $showRecipeResults) {
                    RecipeResultsView(recipes: recipes)
                }
            }
            .padding()
            .background(Color.EUorange)
        }
    }
    
//prints state in console to validate if the function is called
func fetchRecipes() 
    {
        print("Fetching recipes...")
        
        //constructs parameters for the API request
        var parameters = [
            "ingredients": selectedOptions.joined(separator: ","),
            "apiKey": apiKey
        ]
        
        //adds dietary restrictions if any selected
        if !selectedDietaryRestrictions.isEmpty
        {
            parameters["diet"] = selectedDietaryRestrictions.joined(separator: ",")
        }
        
        //contructs the URL for the API request
        let urlString = "\(baseURL)?\(parameters.urlEncoded())"
        
        print("Fetching recipes from URL:", urlString) //prints statement to print the constructed URL
        
        guard let url = URL(string: urlString) else
        {
            print("Failed to construct URL")
            return
        }
        
        //creates a URLSession data task to perform the API request
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error 
            {
                print("Error fetching recipes:", error.localizedDescription) // Print statement to print any errors
                return
            }
            
            //checks for missing data
            guard let data = data else
            {
                print("No data received")
                return
            }
            
            //prints statement to print the response data as a string
            if let responseString = String(data: data, encoding: .utf8)
            {
                print("Response data:", responseString)
            }
            
            //attempts to decode the response data into an array of Recipe objects
            if let decodedResponse = try? JSONDecoder().decode([Recipe].self, from: data) {
                //updates the UI on the main thread
                DispatchQueue.main.async {
                    //updates the recipes array with the decoded recipes
                    self.recipes = decodedResponse
                    //sets the flag to indicate that recipe results should be shown
                    self.showRecipeResults = true
                    //fetches image URLs for the fetched recipes
                    self.fetchImageURLs(for: decodedResponse)
                }
            } else {
                //logs an error if decoding fails
                print("Failed to decode response")
            }
        }
        
        //prints statement to indicate the data task is initiated
        print("Initiating data task")
        
        //starts the data task
        task.resume()
    }


    
struct Recipe: Codable, Identifiable 
    {
    let id: Int
    let title: String
    var imageURL: String?
    }
    
//displays recipe results
struct RecipeResultsView: View
    {
        let recipes: [Recipe]
        
        var body: some View 
    {
            List
            {
                ForEach(recipes)
                { recipe in
                    NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                        HStack 
                        {
                            if let imageURL = recipe.imageURL,
                               let url = URL(string: imageURL),
                               let imageData = try? Data(contentsOf: url),
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(5)
                            }
                            Text(recipe.title)
                                .bold()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle()) //uses PlainListStyle to remove default styling
            .background(Color.EUyellow)
            .navigationBarTitle("Recipe Results")
        }
    }

    
//displays the recipe instructions
struct RecipeDetailsView: View 
{
    let recipe: Recipe
    @State private var instructions: String = ""
        
    var body: some View
    {
        VStack
        {
            Text(recipe.title)
                .font(.title)
                .padding()
                
            ScrollView
            {
                Text(instructions)
                    .padding()
            }
                
            Spacer()
            }
            .navigationBarTitle(recipe.title)
            
            .onAppear
        {
                fetchInstructions()
            }
            .background(Color.EUyellow)
        }
        
    //retrives recipe instructions from API
    func fetchInstructions()
    {
            let urlString =  "https://api.spoonacular.com/recipes/\(recipe.id)/analyzedInstructions?apiKey=\(apiKey)"
            
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                if let instructionsResponse = try? JSONDecoder().decode([InstructionResponse].self, from: data) {
                    DispatchQueue.main.async {
                        if let instruction = instructionsResponse.first?.steps.map({ $0.step }).joined(separator: "\n") {
                            self.instructions = instruction
                        }
                    }
                } else {
                    print("Failed to decode instructions response")
                }
            }
            task.resume()
        }
    }
    
    
struct InstructionResponse: Codable 
    {
    let steps: [Step]
    }
    
struct Step: Codable 
    {
    let step: String
    }
    
 
    
struct HeaderView: View
    {
        let title: String
        let color: Color
        
        //edits the food headers
        var body: some View {
            ZStack {
                color
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
    
    
    
func fetchImageURLs(for recipes: [Recipe])
{
    for recipe in recipes
        {
        let urlString = "https://api.spoonacular.com/recipes/\(recipe.id)/information?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
            
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else 
            {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
                
            if let infoResponse = try? JSONDecoder().decode(RecipeInformationResponse.self, from: data) {
                    DispatchQueue.main.async {
                        if let imageURL = infoResponse.image {
                            //updates the recipe's imageURL property
                            if let index = self.recipes.firstIndex(where: { $0.id == recipe.id }) {
                                var updatedRecipe = self.recipes[index]
                                updatedRecipe.imageURL = imageURL
                                self.recipes[index] = updatedRecipe
                            }
                        }
                    }
                } else {
                    print("Failed to decode information response")
                }
                
            }
            task.resume()
        }
    }
    
struct RecipeInformationResponse: Codable
    {
        let image: String?
    }
    
    
}

#Preview {
   FrontPage()
}


//API information
let apiKey = "9ca69700173345e1beea2ec3c58cec6b"
let baseURL = "https://api.spoonacular.com/recipes/findByIngredients"
