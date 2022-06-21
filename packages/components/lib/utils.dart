part of components;

class Utils {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    TextAlign textAlign = start,
    Color color = white,
    double fontSize = 12
  }){

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Content(
          text: message,
          textAlign: textAlign,
          color: color,
          fontSize: fontSize,
        ),)
    );

  }

  static String generateId(id){
    return '$id-${DateTime.now().microsecondsSinceEpoch.toString()}';
  }
}