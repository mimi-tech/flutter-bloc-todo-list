class NewUser {

  String? userName;
  String? password;


  NewUser({

    this.userName,
    this.password,



  });

  // now create converter

  factory NewUser.fromJson(Map<String,dynamic> responseData){
    return NewUser(

      userName: responseData['lastName'],
      password: responseData['password'],

    );
  }
  Map<String, dynamic> toJson() {
    return {

      "lastName": userName,
      "password": password,

    };
  }
}