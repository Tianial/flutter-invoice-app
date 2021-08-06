import 'package:flutter/foundation.dart';
import 'package:flutter_demo_app/models/taxes.dart';

class TaxProvider extends ChangeNotifier {
  // Private
  List<Taxes> _taxList = [
    Taxes('Mwst_10', '10.0'),
    Taxes('Mwst_19', '20.60'),
    Taxes('VAT_32', '40.0'),
    Taxes('Money_6', '1.0'),
    Taxes('Nkap_', '1.0'),
    Taxes('VAT_20', '1.0'),
    Taxes('Mwst_6', '1.0'),
  ];

  // Public
  List<Taxes> get taxList {
    return [..._taxList];
  }

  void createTax(Taxes item) {
    _taxList.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void updateTax(Taxes updatedTax) {
    var taxIndex =
        _taxList.indexWhere((element) => element.id == updatedTax.id);
    if (taxIndex >= 0) {
      _taxList[taxIndex] = updatedTax;
      // This call tells the widgets that are listening to this model to rebuild.
      notifyListeners();
    }
  }

  void deleteTax(int taxIndexToDelete) {
    if (taxIndexToDelete >= 0) {
      _taxList.removeAt(taxIndexToDelete);
      // This call tells the widgets that are listening to this model to rebuild.
      notifyListeners();
    }
  }
}
