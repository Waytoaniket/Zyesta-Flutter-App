import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zyesta_app/app_theme.dart';

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'enter a valid email address')
]);
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');

final ageValidator = MultiValidator([
  RequiredValidator(errorText: 'Age is required'),
  RangeValidator(errorText: 'Put valid age', min: 18, max: 150)
]);
final mobileNumValidator = MultiValidator([
  RequiredValidator(errorText: 'Mobile Number is required'),
  PatternValidator(r'^[6-9]\d{9}$', errorText: 'Enter valid phone Number')
]);

Widget getInputField(
    size,
    context,
    TextEditingController _userName,
    TextEditingController _firstName,
    TextEditingController _lastName,
    TextEditingController _email,
    TextEditingController _password,
    TextEditingController _confirmPassword,
    TextEditingController _age,
    TextEditingController _gender,
    TextEditingController _mobileNumber,
    TextEditingController _city,
    bool passwordNotVisible,
    bool confirmedPasswordNotVisible,
    bool userNameTaken,
    bool searchIndicator,
    Function changePasswordVisibility,
    Function changeConfirmedPasswordVisibility,
    Function checkUsername,
    Function userSearchIndicator) {
  return Padding(
    padding: EdgeInsets.only(left: size.width / 12, right: size.width / 12),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "SIGN UP CREDENTIALS",
            style: TextStyle(
                fontSize: 14.0,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(top: size.width / 30),
          alignment: Alignment.center,
          child: field(size, context, "First Name", Icons.person, _firstName,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "Last Name", Icons.person, _lastName,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: userNameField(
              size,
              context,
              "Username",
              Icons.person,
              _userName,
              TextInputType.text,
              userNameTaken,
              searchIndicator,
              checkUsername,
              userSearchIndicator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "Email ID", Icons.email, _email,
              TextInputType.emailAddress,
              multiValidator: emailValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: passwordField(
              size,
              context,
              "Password",
              Icons.lock,
              passwordNotVisible ? Icons.visibility_off : Icons.visibility,
              _password,
              TextInputType.visiblePassword,
              passwordNotVisible,
              changePasswordVisibility,
              passwordValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: confirmPasswordField(
            size,
            context,
            "Confirm Password",
            Icons.lock,
            confirmedPasswordNotVisible
                ? Icons.visibility_off
                : Icons.visibility,
            _confirmPassword,
            _password,
            TextInputType.visiblePassword,
            confirmedPasswordNotVisible,
            changeConfirmedPasswordVisibility,
          ),
        ),
        SizedBox(height: size.width / 8),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "PERSONAL DETAILS",
            style: TextStyle(
                fontSize: 14.0,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(top: size.width / 30),
          alignment: Alignment.center,
          child: field(
            size,
            context,
            "Age",
            Icons.person,
            _age,
            TextInputType.number,
            multiValidator: ageValidator,
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "Gender", Icons.person, _gender,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(
            size,
            context,
            "Mobile Number",
            Icons.phone,
            _mobileNumber,
            TextInputType.number,
            multiValidator: mobileNumValidator,
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "City", Icons.location_city, _city,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
      ],
    ),
  );
}

Widget field(Size size, context, String hintText, IconData icon,
    TextEditingController cont, TextInputType textinput,
    {MultiValidator? multiValidator,
    RequiredValidator? requiredValidator,
    RangeValidator? rangeValidator}) {
  final node = FocusScope.of(context);
  var validate = multiValidator == null
      ? (rangeValidator == null ? requiredValidator! : rangeValidator)
      : multiValidator;
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onFieldSubmitted: (value) {},
    onEditingComplete: () => node.nextFocus(),
    keyboardType: textinput,
    textAlignVertical: TextAlignVertical.bottom,
    controller: cont,
    style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
    decoration: InputDecoration(
      helperText: "",
      helperStyle: TextStyle(height: 0.5),
      errorStyle: TextStyle(height: 0.5),
      prefixIcon: iconDecoration(icon),
      hintText: hintText,
      hintStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width),
          borderSide: BorderSide.none),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white,
    ),
    validator: validate,
  );
}

Widget userNameField(
    Size size,
    context,
    String hintText,
    IconData icon,
    TextEditingController cont,
    TextInputType textinput,
    bool userNameTaken,
    bool searchIndicator,
    Function checkUserName,
    Function userSearchIndicator) {
  final node = FocusScope.of(context);

  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onFieldSubmitted: (value) {},
    onEditingComplete: () => node.nextFocus(),
    keyboardType: textinput,
    textAlignVertical: TextAlignVertical.bottom,
    controller: cont,
    style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
    decoration: InputDecoration(
      helperText: "",
      helperStyle: TextStyle(height: 0.5),
      errorStyle: TextStyle(height: 0.5),
      prefixIcon: iconDecoration(icon),
      suffixIcon: searchIndicator
          ? Transform.scale(
              scale: 0.5,
              child: SizedBox(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
                height: 10.0,
                width: 10.0,
              ),
            )
          : SizedBox(),
      hintText: hintText,
      hintStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width),
          borderSide: BorderSide.none),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white,
    ),
    onChanged: (value) {
      userSearchIndicator();
      checkUserName(value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        return 'Enter Unique UserName';
      } else if (userNameTaken) {
        print(userNameTaken);
        return 'UserName Already Taken';
      } else {
        print(userNameTaken);
        return null;
      }
    },
  );
}

Widget passwordField(
    Size size,
    context,
    String hintText,
    IconData prefixIcon,
    IconData suffixIcon,
    TextEditingController cont,
    TextInputType textinput,
    bool visible,
    Function changeVisibility,
    MultiValidator validate) {
  final node = FocusScope.of(context);

  return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textinput,
      textAlignVertical: TextAlignVertical.bottom,
      controller: cont,
      obscureText: visible,
      onEditingComplete: () => node.nextFocus(),
      style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
      decoration: InputDecoration(
        prefixIcon: passwordIconDecoration(prefixIcon, changeVisibility),
        suffixIcon: passwordIconDecoration(suffixIcon, changeVisibility),
        helperText: "",
        helperStyle: TextStyle(height: 0.5),
        errorStyle: TextStyle(height: 0.5),
        hintText: hintText,
        hintStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width),
            borderSide: BorderSide.none),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
      validator: validate);
}

Widget confirmPasswordField(
  Size size,
  context,
  String hintText,
  IconData prefixIcon,
  IconData suffixIcon,
  TextEditingController cont,
  TextEditingController pass,
  TextInputType textinput,
  bool visible,
  Function changeVisibility,
) {
  final node = FocusScope.of(context);

  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: textinput,
    textAlignVertical: TextAlignVertical.bottom,
    controller: cont,
    obscureText: visible,
    onEditingComplete: () => node.nextFocus(),
    style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
    decoration: InputDecoration(
      prefixIcon: passwordIconDecoration(prefixIcon, changeVisibility),
      suffixIcon: passwordIconDecoration(suffixIcon, changeVisibility),
      helperText: "",
      helperStyle: TextStyle(height: 0.5),
      errorStyle: TextStyle(height: 0.5),
      hintText: hintText,
      hintStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width),
          borderSide: BorderSide.none),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white,
    ),
    validator: (val) => MatchValidator(errorText: 'passwords do not match')
        .validateMatch(cont.text, pass.text),
  );
}

Widget iconDecoration(
  icon,
) {
  return Icon(
    icon,
    size: 28,
    color: Color.fromARGB(255, 122, 25, 173),
  );
}

Widget passwordIconDecoration(icon, Function changeVisibility) {
  return InkWell(
    onTap: () {
      changeVisibility();
      print("pressed");
    },
    child: Icon(
      icon,
      size: 28,
      color: Color.fromARGB(255, 122, 25, 173),
    ),
  );
}
