import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/routes/Approutes.dart';
import 'package:flutter_demo_app/models/taxes.dart';
import 'package:flutter_demo_app/settings/taxes/provider/TaxProvider.dart';
import 'package:provider/provider.dart';

class TaxesPages extends StatefulWidget {
  // widget is stateful b/c it changes states(the list can be edit or deleted).Navigation is not counted tobe statefull
  @override
  _TaxesPagesState createState() => _TaxesPagesState();
}

class _TaxesPagesState extends State<TaxesPages> {

  void goToNewTaxesPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        AppRoutes.NewTaxesPage); //context here is the actual page informations
  }

  void goToEdit(BuildContext context, Taxes tax) {
    Navigator.of(context).pushNamed(AppRoutes.NewTaxesPage, arguments: tax);
  }

  void deleteTax(int index) {
    Provider.of<TaxProvider>(context, listen: false).deleteTax(index);
  }

  Future<void> _showMyDialog(int index) async {
    //when a future is called,async is a mechanism use to represent a value which will be there in the future .
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text('Would you like to delete the Tax?'),
          actions: <Widget>[
            //array of widget
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                deleteTax(index);
                Navigator.of(context)
                    .pop(); //closes the dialog after delating in other to return to the list
              },
            ),
          ],
        );
      },
    );
  }

  ListTile renderTaxes(Taxes taxes, BuildContext context, int index) {
    return ListTile(
        leading: Text(taxes.taxName),
        title: Text(taxes.percenTage),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => goToEdit(context, taxes),
            ), // Trailing waits the widjet text//
            new IconButton(
              icon: Icon(Icons.delete),
              //onPressed: () => deleteTax(index),
              onPressed: () => _showMyDialog(index),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taxes'),
      ),
      body: Consumer<TaxProvider>(
        builder: (context, taxProvider, child) {
         final taxList = taxProvider.taxList;
          return ListView(
            children: taxList.asMap().entries.map((entry) {
              int index = entry.key;
              Taxes tax = entry.value;
              return this.renderTaxes(tax, context, index);
            }).toList(), //map transforms elements in taxList into widget
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () => goToNewTaxesPage(
            context), // when we navigate from newtax it goes back to Taxes thanks to thi line
      ),
    );
  }
}
