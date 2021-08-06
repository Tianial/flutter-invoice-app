import 'package:flutter/material.dart';
import 'package:flutter_demo_app/models/taxes.dart';
import 'package:flutter_demo_app/settings/taxes/provider/TaxProvider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class NewTaxesPage extends StatefulWidget {
  @override
  _NewTaxesPageState createState() => _NewTaxesPageState();
}

class _NewTaxesPageState extends State<NewTaxesPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormBuilderState>();

  Taxes tax;

  bool isEditing = false;

  void saveTaxAndGoBack() {
    // 1. Check if form valid
    if (_formKey.currentState.saveAndValidate() == true) {
      // Get form value
      var map = _formKey.currentState.value;
      tax.taxName = map['name'];
      tax.percenTage = map['rate'];

      // Get the Tax provider
      final taxProvider = Provider.of<TaxProvider>(context, listen: false);

      print(tax);

      if (isEditing) {
        taxProvider.updateTax(tax);
      } else {
        // Save Tax in Provider
        taxProvider.createTax(tax);
      }

      Navigator.of(context)
          .pop(); //pop removes the route at the top of the actual screen and goes back to the precedent page after execution
    }
  }

  @override
  Widget build(BuildContext context) {
    //final _scaffold = Scaffold.of(context);

    final selectedTax = ModalRoute.of(context).settings.arguments; // At this point,argument=tax(all the path taken here is to take the value of tax.//
    if (selectedTax != null) {
      tax = selectedTax;
      isEditing = true;
    } else {
      tax = Taxes(null, null);
    } //phase of initialisation

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTax != null ? 'Edit Taxes' : 'Add Taxes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                attribute: 'name',
                initialValue: tax.taxName,
                decoration: InputDecoration(labelText: 'Tax Name*'),
                textInputAction: TextInputAction.next,
                validators: [FormBuilderValidators.required()],
                valueTransformer: (value) => value.trim(),
              ),
              FormBuilderTextField(
                attribute: 'rate',
                initialValue: tax.percenTage,
                decoration: InputDecoration(labelText: 'Wert in Percentage*'),
                textInputAction: TextInputAction.next,
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric()
                ],
                //require here meaans field schould not be empty//
                valueTransformer: (value) => value.trim(),
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
