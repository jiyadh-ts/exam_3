import 'package:exam_3/view/home_page/homepage.dart';
import 'package:exam_3/view/registration/registration.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String email;
  final String password;

  Login({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 28,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form( 
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Sign in to your Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: loginEmailController,
                validator: (value) {
                  if (value == null ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return " Enter a valid Email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Your Email Address",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                 
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: loginPasswordController,
                validator: (value) {
                  if (value == null || value.length < 7) {
                    return "Please write a password with at least 7 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Your Password",
                  hintStyle: TextStyle(fontWeight: FontWeight.w500),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Colors.grey.shade500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate() &&
                      (loginEmailController.text == email &&
                          loginPasswordController.text == password)) {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                  builder: (context) => Homepage()));
                
                  }else{
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10)
        ),
       padding: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
         content: Text("Failed to login")) ) ;         
                          }
                },
         child: Container(
          height: 40,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 3, 81, 145),
               ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),),),
              ),
              Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        },
                        child: Text("Sign Up"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
