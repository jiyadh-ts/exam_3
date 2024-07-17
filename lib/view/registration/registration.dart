import 'package:exam_3/view/login/login.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
   Registration({super.key});

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

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
                "Sign Up for Free",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: EmailController,
                validator: (value) {
                  if (value == null ||  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") .hasMatch(value)) {
                    return null;
                  }
                  return "Please enter  a valid Email";
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
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.length < 7) {
                    return "Please write a password with at least 7 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: " Your Password",
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
              TextFormField(
                controller: ConfirmPasswordController,
                validator: (value) {
                  if (value == null || value!=passwordController.text) {
                    return "Enter the correct password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: " Your Confirm Password",
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
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                      email: EmailController.text,
                      password: passwordController.text,
                      
                    )));
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
                  )),
                ),
              ),
              Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(fontWeight: FontWeight.w600),), TextButton(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                                            email: '',
                                            password: '',
                                            
                                          )));
          
                    }, child: Text("Sign in"))],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
