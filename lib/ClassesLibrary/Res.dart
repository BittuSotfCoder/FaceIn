// ignore: file_names
class Res {
  String getString(String action) {
    String link = "http://192.168.1.40/API/jsonDataInsert.php?action=$action";
    return link;
  }
}
