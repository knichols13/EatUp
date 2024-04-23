import SwiftUI

//custom app colors
extension Color 
{
    static let EUorange = Color(#colorLiteral(red: 0.8248596554, green: 0.2363930045, blue: 0.06308363942, alpha: 1))
    static let EUyellow = Color(#colorLiteral(red: 0.9849640727, green: 0.6710997224, blue: 0.05417981744, alpha: 1))
}

struct StartPage: View 
{
    @State private var buttonWidth: CGFloat = 0
    
    var body: some View 
    {
        NavigationView 
        {
            VStack(alignment: .center)
            {
                //image of EatUp logo
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                
                //imported font
                Text("Sign In/Sign Up")
                    .font(Font.custom("BebasNeue-Regular", size: 65))
                    .foregroundColor(.black)
                    .padding()
                
                Text("Existing User?")
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                //connects to sign in page
                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.EUorange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                
                Text("Don't have an account?")
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                //connects to sign up page
                NavigationLink(destination: SignUpView()) 
                {
                    Text("Sign Up")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.EUorange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                Spacer()
                
                //connects to main page
                NavigationLink(destination: FrontPage()) 
                {
                    Text("Continue as Guest")
                        .bold()
                        .padding()
                }
                .foregroundColor(.EUorange)
                
                //EatUp caption
                Text("Your Culinary Companion for Creative")
                    .font(Font.custom("DancingScript-Bold", size: 22))
                Text("Cooking on a Budget!")
                    .font(Font.custom("DancingScript-Bold", size: 22))
            }
            .padding()
            .background(Color.EUyellow)
        }
    }
}

#Preview {
   StartPage()
}
