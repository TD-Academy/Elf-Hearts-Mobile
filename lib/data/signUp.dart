// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:users/services/storage_service.dart';


// const nameExistsMes = 'User with this username already exists!';
// const userWithEmailExistsMes = 'This mail is already registered!';
// const userWithPhoneNumberExistsMes = 'This phone number is already registered!';
// const fieldNullMes = 'All fields must be filled!';

// var userExists = false;
// var responseMessages = [];

// class User {
//   var firstname;
//   var lastName;
//   var userName;
//   var email;
//   var phoneNumber;
//   var password;
// }

// void signUp(firstName, lastname, userName, email, phoneNumber, password) async {
//   if (firstName ||
//       lastname ||
//       userName ||
//       email ||
//       phoneNumber ||
//       password == null) {
//     responseMessages.add(fieldNullMes);
//   }

//   try {
//     var data = await http.get(url);
//     var jsonData = jsonDecode(data.body);

//     for (var i = 0; i < jsonData.length; i++) {
//       if (userName == jsonData[i]['userName']) {
//         responseMessages.add(nameExistsMes);
//       } else if (email == jsonData[i]['email']) {
//         responseMessages.add(userWithEmailExistsMes);
//       } else if (phoneNumber == jsonData[i]['phoneNumber']) {
//         responseMessages.add(userWithPhoneNumberExistsMes);
//       }

//       if (responseMessages.length != 0) {
//         var user = User();

//         user.firstname = firstName;
//         user.lastName = lastname;
//         user.userName = userName;
//         user.email = email;
//         user.phoneNumber = phoneNumber;
//         user.password = password;
//       }
//     }
//     print(responseMessages);
//   } catch (e) {
//     print(e);
//   }
// }
