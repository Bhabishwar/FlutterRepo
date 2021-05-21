import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/src/api/auth_api.dart';
import 'package:login/src/mixing/validation_mixin.dart';
import 'package:login/src/screen/homepage.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> with validationMixin {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? gender;
  bool isLoading = false;
  bool isOfSecure =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.green,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildEmialField(),
                    buildPasswordField(),
                    SizedBox(height: 16),
                    buildDropDownButtionField(),
                    SizedBox(height: 16),
                    submitButton(),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildEmialField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: validEmail,
        onSaved: (String? Val) {
          email = Val;
        },
        decoration: InputDecoration(
            labelText: "Your Email",
            hintText: "example@gmail.com",
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: validPassword,
        onSaved: (String? Val) {
          password = Val;
        },
        obscureText: isOfSecure,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: (){
           setState(() {
             isOfSecure = !isOfSecure;
           });
            },
          ),
            labelText: "Your Password",
            hintText: "**********",
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildDropDownButtionField() {
    return DropdownButtonFormField(
      onChanged: (String? Val) {},
      onSaved: (String? Val) {
        gender = Val;
      },
      items: [
        DropdownMenuItem(
          child: Text("select"),
          value: "select",
        ),
        DropdownMenuItem(
          child: Text("Male"),
          value: "Male",
        ),
        DropdownMenuItem(
          child: Text("Female"),
          value: "Female",
        ),
      ],
      validator: validGender,
      decoration: InputDecoration(
          hintText: "Please select",
          labelText: "Male",
          border: OutlineInputBorder()),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      child: isLoading
          ? null
          : ElevatedButton(
              onPressed: () {
                onSubmitButtonClick();
              },
              child: isLoading ? CircularProgressIndicator():  Text("Submit"),
              // // style: ButtonStyle(
              // //   padding: MaterialStateProperty.all(EdgeInsets.all(16),),
              // //   backgroundColor: MaterialStateProperty.all(Colors.red)
              //
              // ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16), primary: Colors.amberAccent),
            ),
    );
  }

  Future<void> onSubmitButtonClick() async {
    bool valueInput = formKey.currentState!.validate();
    if (valueInput) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });

      var response = await authApi.SignUp(email!, password!, gender!);
      await Future.delayed(Duration(seconds: 15));
      setState(() {
        isLoading = false;
      });

      if (response == null) {
        ScaffoldMessengerState messagenger = ScaffoldMessenger.of(context);

        messagenger.showSnackBar(SnackBar(content: Text("Sign Up Fail")));
      } else {

        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context){
            return Homepage(email : email!);
          })
        );
      }
    }
  }
}
