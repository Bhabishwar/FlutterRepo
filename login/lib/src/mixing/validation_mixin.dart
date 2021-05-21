import 'package:flutter/material.dart';

class validationMixin
{
 String? validEmail (String? val){
  if(val!.contains("@") && val.contains(".")){
  return null;
  }
  else{
  return "Invalid email";
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

 String? validGender (String? val){
   if(val.toString()==null){
     return "select Gender";
   }
   else if (val!.toString()=="select"){
     return "select Gender";
   }
   else{
     return null;
   }
 }
 String? validNull (String? val){
   if(val!.isEmpty){
     return "select Gender";
   }
   else{
     return null;
   }
 }

}