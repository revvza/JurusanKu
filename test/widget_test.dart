import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse(
      "https://jurusan-ef3d5-default-rtdb.asia-southeast1.firebasedatabase.app/jurusan.json");
  var res = await http.get(url);

  print(res.body);
}
