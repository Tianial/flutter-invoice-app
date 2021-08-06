class Taxes {
  String id;
  String taxName;
  String percenTage;

  Taxes(this.taxName, this.percenTage) {
    this.id = DateTime.now().millisecond.toString();
  }
}
