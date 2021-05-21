import 'package:flutter/material.dart';
import 'package:login/src/api/access_api_token.dart';
import 'package:login/src/mixing/validate_user_access.dart';

class LoginAccessTokenScreen extends StatefulWidget {
  @override
  _LoginAccessTokenScreenState createState() => _LoginAccessTokenScreenState();
}

class _LoginAccessTokenScreenState extends State<LoginAccessTokenScreen> with validateUserAccess {

  final formKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? U_ID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.green,
              child:Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    buildEmialField(),
                    buildPasswordField(),

                    SizedBox(height: 16),
                    submitButton(),
                  ],
                ),
              )

          ),
        ),
      ),
    );
  }

  Widget buildEmialField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator:validMobile,
        onSaved: (String? Val){
          userName = Val;
        },
        decoration: InputDecoration(
            labelText: "Enter Your Mobile No",
            hintText: "Enter Your Mobile",
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(

        validator:validPassword,

        onSaved: (String? Val){
          password = Val;
        },
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Your Password",
            hintText: "**********",
            border: OutlineInputBorder()),
      ),
    );
  }



  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: () {
        onSubmitButtonClick();
      },
        child: Text("Submit"),
        // // style: ButtonStyle(
        // //   padding: MaterialStateProperty.all(EdgeInsets.all(16),),
        // //   backgroundColor: MaterialStateProperty.all(Colors.red)
        //
        // ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
            primary: Colors.amberAccent
        ),

      ),



    );
  }

  Future<void> onSubmitButtonClick()  async {
    bool valueInput  =  formKey.currentState!.validate();
    if(valueInput)
    {

      formKey.currentState!.save();
      var response =  await  AccessToken.accesstoken(userName!, password!, "7df7389a67281e79");
      print(response);


    }
  }
}
