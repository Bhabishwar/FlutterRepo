
import 'package:flutter/material.dart';
class validateUserAccess{
  String? validMobile (String? val){
    if(val!.length==10){
      return null;
    }
    else{
      return "Invalid Mobile Number";
    }
  }

  String? validPassword (String? val){
    if(val!.length>6){
      return null;
    }
    else{
      return "Invalid Password";
    }
  }

}

