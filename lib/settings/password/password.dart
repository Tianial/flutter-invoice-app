import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final _formKey = GlobalKey<FormBuilderState>();

  void saveTaxAndGoBack() {
    // 1. Check if form valid
    if (_formKey.currentState.saveAndValidate() == true) {
      Navigator.of(context).pop(); //pop removes the route at the top of the actual screen and goes back to the precedent page after execution
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                attribute: 'oldPassword',
                decoration: InputDecoration(labelText: 'Old Password*'),
                validators: [FormBuilderValidators.required()],
                //require here meaans field schould not be empty//
                textInputAction: TextInputAction.next,
                valueTransformer: (value) => value.trim(),
                obscureText: true,
              ),
              FormBuilderTextField(
                attribute: 'newPassword',
                decoration: InputDecoration(labelText: 'New Password*'),
                validators: [FormBuilderValidators.required()],
                //require here meaans field schould not be empty//
                textInputAction: TextInputAction.next,
                valueTransformer: (value) => value.trim(),
                obscureText: true,

              ),
              FormBuilderTextField(
                attribute: 'repeatPassword',
                decoration: InputDecoration(labelText: 'Repeat Password*'),
                validators: [
                  FormBuilderValidators.required(),
                      (value) {
                    var pwd = _formKey.currentState.value['password'];
                    if (value != pwd) {
                      return 'Password does not match';
                    } else {
                      return null;
                    }
                  }
                ],
                //require here meaans field schould not be empty//
                textInputAction: TextInputAction.next,
                valueTransformer: (value) => value.trim(),
                obscureText: true,

              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: new RaisedButton(
                    child: Text('Save'),
                    onPressed: saveTaxAndGoBack,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
