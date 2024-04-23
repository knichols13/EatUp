import SwiftUI

struct SignInView: View 
{
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isSignedIn: Bool = false //tracks signin status
    @State private var showFrontPage: Bool = false //controls presentation of FrontPage
    @State private var isEmailValid: Bool = true //tracks email validation status
    
    var body: some View 
    {
        NavigationView 
        {
            VStack(spacing: 20) 
            {
                Spacer()
                
                Text("Sign In")
                    .font(Font.custom("BebasNeue-Regular", size: 65))//custom font
                    .padding(.bottom, 20)

                Text("Email Address:")
                    .bold()
                    

                TextField("Enter your email", text: $emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .onChange(of: emailAddress)
                {
                        if emailAddress == ""
                    {
                            //performs action when email field is empty
                        } else 
                    {
                            //performs action when email field has a new value
                            isEmailValid = isValidEmail(emailAddress)
                        }
                    }

                    .autocapitalization(.none)

                //prints in field if email is not valid
                if !isEmailValid 
                {
                    Text("Please enter a valid email")
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Text("Password:")
                    .bold()
                

                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                //remeber me button to ensure user doens't have to log in if selected
                HStack 
                {
                    Toggle(isOn: $rememberMe) 
                    {
                        Text("Remember Me")
                            .bold()
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .EUorange))
                    .padding(.leading, 5)

                    Spacer()
                }

            
                Button(action: 
                        {
                    //performs sign in action here
                    //prints to console to verify
                    print("Signing In...")
                    // For now, assume sign in is successful
                    self.isSignedIn = true
                    self.showFrontPage = true // Show FrontPage
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.EUorange)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .disabled(emailAddress.isEmpty || password.isEmpty || !isEmailValid) //disable button if email or password is empty or email is invalid

                HStack 
                {
                    Spacer()
                    Button(action: 
                            {
                        //handles forgot password action
                        print("Forgot Password?")
                    }) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .foregroundColor(.EUorange)
                            .underline()
                    }
                    .padding(.top, 10)
                }

                Spacer() //pushes content to center vertically
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity) //expand to fill available space
            .background(Color.EUyellow)
            .navigationTitle("Sign In")
            .navigationBarHidden(true) //hides navigation bar
            .fullScreenCover(isPresented: $showFrontPage, content: {
                FrontPage()
            })
        }
        .edgesIgnoringSafeArea(.all) //ensures the preview doesn't get cut off
    }
    
    //verifies is user inputted a valid email 
    func isValidEmail(_ email: String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    SignInView()
}
