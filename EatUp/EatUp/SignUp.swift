import SwiftUI

struct SignUpView: View 
{
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var reEnterPassword: String = ""
    @State private var isSignedUp: Bool = false //tracks the signup status - helps validate if user inputs values or not
    @State private var isEmailValid: Bool = true //tracks email validation status
    @State private var showFrontPage: Bool = false

    var body: some View 
    {
        NavigationView 
        {
            VStack(spacing: 20) 
            {
                Text("Sign Up")
                    .font(Font.custom("BebasNeue-Regular", size: 65))
                    .padding(.bottom, 10)

                //text fields for first name, last name, email, password, and re-enter password
                VStack(alignment: .leading, spacing: 10)
                {
                    Text("First Name:")
                        .bold()
                    TextField("Enter your first name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                VStack(alignment: .leading, spacing: 10) 
                {
                    Text("Last Name:")
                        .bold()
                    TextField("Enter your last name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                VStack(alignment: .leading, spacing: 10) 
                {
                    Text("Email Address:")
                        .bold()
                    TextField("Enter your email", text: $emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }

                if !isEmailValid
                {
                    Text("Please enter a valid email")
                        .foregroundColor(.red)
                        .font(.caption)
                }

                
                
                VStack(alignment: .leading, spacing: 10)
                {
                    Text("Password:")
                        .bold()
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                VStack(alignment: .leading, spacing: 10) 
                {
                    Text("Re-enter Password:")
                        .bold()
                    SecureField("Re-enter your password", text: $reEnterPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Button(action: 
                        {
                    //performs sign up action here
                    //prints to console to verify
                    print("Signing Up...")
                    //for now assume sign up is successful
                    self.isSignedUp = true
                    self.showFrontPage = true //shows the FrontPage
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.EUorange)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                //ensures user inputs information
                .disabled(firstName.isEmpty || lastName.isEmpty || emailAddress.isEmpty || !isEmailValid || password.isEmpty || reEnterPassword.isEmpty)

                

                NavigationLink(destination: SignInView()) 
                {
                    Text("Already have an account? Sign In")
                        .font(.headline)
                        .foregroundColor(.EUorange)
                        .underline()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.EUyellow)
            .navigationBarTitle("Sign Up", displayMode: .inline)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showFrontPage, content: {
                FrontPage()
            })
        }
    }
}

//verifies is user inputted a valid email
func isValidEmail(_ email: String) -> Bool
{
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}


#Preview {
    SignUpView()
}
