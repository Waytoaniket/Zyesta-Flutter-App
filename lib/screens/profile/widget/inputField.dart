import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zyesta_app/screens/profile/widget/profile_widgets.dart';
import 'package:sizer/sizer.dart';

class TextParaInput extends StatelessWidget {
  const TextParaInput({
    Key? key,
    required this.node,
    required bool status,
    required String heading,
    required TextEditingController cont,
    required this.requiredValidator,
  }) : _status = status, _about = cont,heading = heading, super(key: key);

  final FocusScopeNode node;
  final bool _status;
  final String heading;

  final TextEditingController _about;
  final RequiredValidator requiredValidator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      decoration: boxProfileDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: profileHeading),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) {},
            onEditingComplete: () => node.nextFocus(),
            style: contentHeading,
            decoration: profileInputDecoration,
            enabled: !_status,
            autofocus: !_status,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: _about,
            validator: requiredValidator,
          ),
        ],
      ),
    );
  }
}

class TextJobInput extends StatelessWidget {
  const TextJobInput({
    Key? key,
    required this.node,
    required bool status,
    required TextEditingController jobTitle,
    required TextEditingController company,
    required TextEditingController university,
  }) : _status = status, _jobTitle = jobTitle, _company = company, _university = university, super(key: key);

  final FocusScopeNode node;
  final bool _status;
  final TextEditingController _jobTitle;
  final TextEditingController _company;
  final TextEditingController _university;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      width: 80.w,
      decoration: boxProfileDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Job and Education",style: profileHeading),
          jobInput(jobIcon: Icons.location_city, jobHeading: ' Job Title    ', node: node, status: _status, jobTitle: _jobTitle),
          jobInput(jobIcon: Icons.corporate_fare, jobHeading: ' Company', node: node, status: _status, jobTitle: _company),
          jobInput(jobIcon: Icons.school, jobHeading: ' University ', node: node, status: _status, jobTitle: _university),
        ],
      ),
    );
  }
}

class jobInput extends StatelessWidget {
  const jobInput({
    Key? key,
    required this.jobIcon,
    required this.jobHeading,
    required this.node,
    required bool status,
    required TextEditingController jobTitle,
  }) : _status = status, _jobTitle = jobTitle, super(key: key);

  final IconData jobIcon;
  final String jobHeading;
  final FocusScopeNode node;
  final bool _status;
  final TextEditingController _jobTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
      [
        Icon(
          jobIcon,
          color: Color(0xFF7819AD),
          size: 4.w,
        ),
        Text(jobHeading, style: subHeading),
        SizedBox(width: 3.w,),
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) {},
            onEditingComplete: () => node.nextFocus(),
            style: contentHeading,
            decoration: profileInputDecoration,
            keyboardType: TextInputType.multiline,
            maxLength: 50,
            maxLines: 2,
            minLines: 1,
            enabled: !_status,
            autofocus: !_status,
            controller: _jobTitle,
          ),
        ),
      ],
    );
  }
}

class TextPersonalDetailsInput extends StatelessWidget {
  const TextPersonalDetailsInput({
    Key? key,
    required this.node,
    required bool status,
    required TextEditingController firstName,
    required this.requiredValidator,
    required TextEditingController lastName,
    required TextEditingController age,
    required this.ageValidator,
    required TextEditingController gender,
    required TextEditingController city,
  }) : _status = status, _firstName = firstName, _lastName = lastName, _age = age, _gender = gender, _city = city, super(key: key);

  final FocusScopeNode node;
  final bool _status;
  final TextEditingController _firstName;
  final RequiredValidator requiredValidator;
  final TextEditingController _lastName;
  final TextEditingController _age;
  final MultiValidator ageValidator;
  final TextEditingController _gender;
  final TextEditingController _city;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      width: 80.w,
      decoration: boxProfileDecoration,
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text('Personal Details',
              style: profileHeading),
          PersonalDetailsInput(icon: Icons.person, personalDetailHeading: ' Firstname  ', node: node, status: _status, firstName: _firstName, requiredValidator: requiredValidator),
          PersonalDetailsInput(icon: Icons.person, personalDetailHeading: ' Lastname  ', node: node, status: _status, firstName: _lastName, requiredValidator: requiredValidator),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Color(0xFF7819AD),
                size: 4.w,
              ),
              Text(' Age              ',
                  style: subHeading),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {},
                  onEditingComplete: () => node.nextFocus(),
                  style: contentHeading,
                  decoration:
                  profileInputDecoration,
                  enabled: !_status,
                  autofocus: !_status,
                  controller:_age,
                  keyboardType: TextInputType.number,
                  validator: ageValidator,
                ),
              ),
            ],
          ),
          PersonalDetailsInput(icon: Icons.person, personalDetailHeading: ' Gender       ', node: node, status: _status, firstName: _gender, requiredValidator: requiredValidator),
          PersonalDetailsInput(icon: Icons.business, personalDetailHeading: ' City              ', node: node, status: _status, firstName: _city, requiredValidator: requiredValidator),
        ],
      ),
    );
  }
}

class PersonalDetailsInput extends StatelessWidget {
  const PersonalDetailsInput({
    Key? key,
    required this.icon,
    required this.personalDetailHeading,
    required this.node,
    required bool status,
    required TextEditingController firstName,
    required this.requiredValidator,
  }) : _status = status, _firstName = firstName, super(key: key);

  final IconData icon;
  final String personalDetailHeading;
  final FocusScopeNode node;
  final bool _status;
  final TextEditingController _firstName;
  final RequiredValidator requiredValidator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0xFF7819AD),
          size: 4.w,
        ),
        Text(personalDetailHeading,
            style: subHeading),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) {},
            onEditingComplete: () => node.nextFocus(),
            style: contentHeading,
            decoration:
            profileInputDecoration,
            enabled: !_status,
            autofocus: !_status,
            controller:_firstName,
            validator: requiredValidator,
          ),
        ),
      ],
    );
  }
}