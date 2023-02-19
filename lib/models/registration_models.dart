class RegistrationModal {
  String full_name = '';
  String cnic = '';
  String mother_name = "";
  String mother_cnic = '';
  String email = '';
  String password = '';
  String re_password = '';
  String address = '';
  String mobile = '';

  RegistrationModal();

  RegistrationModal.fromMap(Map map) {
    full_name = map['full_name'];
    cnic = map['cnic'];
    mother_name = map['mother_name'];
    mother_cnic = map['mother_cnic'];
    email = map['email'];
    password = map['password'];
    re_password = map['re_password'];
    address = map['address'];
    mobile = map['mobile'];
  }

  formMap(dynamic map) {
    full_name = map['full_name'];
    cnic = map['cnic'];
    mother_name = map['mother_name'];
    mother_cnic = map['mother_cnic'];
    email = map['email'];
    password = map['password'];
    re_password = map['re_password'];
    address = map['address'];
    mobile = map['mobile'];
  }

  Map<String, String> toMap() {
    return {
      'full_name': full_name,
      'cnic': cnic,
      'mother_name': mother_name,
      'mother_cnic': mother_cnic,
      'email': email,
      'password': password,
      're_password': re_password,
      'address': address,
      'mobile': mobile,
    };
  }
}
