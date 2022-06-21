part of components;

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    this.width,
    this.height,
    this.radius = blunt,
    this.isShadow = false,
    this.padding = const [],
    this.margin = const [],
    this.enabledBorderColor = promptColor,
    this.focusedBorderColor = btnColor,
    this.enabledBorderWidth = thin,
    this.focusedBorderWidth = thin,
    this.noBorder = false,
    this.isClassic = false,
    this.labelText,
    this.hintText,
    this.labelColor = textColor,
    this.hintColor = promptColor,
    this.color = textColor,
    this.bgColor = bright,
    this.contentPadding = const [10,15],
    this.icon,
    this.iconSize,
    this.iconColor = promptColor,
    this.prefixIcon,
    this.prefixIconColor = promptColor,
    this.prefixIconSize,
    this.suffixIcon,
    this.suffixText ,
    this.suffixIconColor = promptColor,
    this.suffixIconSize,
    this.autoFocus = false,
    this.isEnabled = true,
    this.isExpands = false,
    this.isFilled = false,
    this.inputType,
    this.controller,
    this.focusNode,
    this.isObscured = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.onChanged,
    this.maxLine = 1,
    this.maxLength,
    this.minLength,
    this.errorColor,
    this.minLine = 1,
    this.emptyErrorText,
    this.patternErrorText,
    this.regExp,
    this.lengthErrorText,
    this.prefix,
    this.suffix,
    this.fontWeight,
    this.fontSize = 18,
    this.fontFamily,
    this.textHeight = 1.5,
    this.suffixIconClick,
    this.changeObscured = false,
    this.clearField = false
  }) : super(key: key);

  final bool autoFocus;
  final bool isEnabled;
  final bool isExpands;
  final bool isFilled;
  final bool changeObscured;
  final bool clearField;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isObscured;

  //overall division
  final double? width;
  final double? height;
  final bool isShadow;
  final double textHeight;
  final List<double> padding;
  final List<double> margin;

  //border style
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double enabledBorderWidth;
  final double focusedBorderWidth;
  final double radius;
  final bool noBorder;
  final bool isClassic;

  //content
  final String? labelText;
  final String? hintText;
  final Color hintColor;
  final Color labelColor;
  final Color? errorColor;
  final Color? color;
  final Color? bgColor;
  final Widget? prefix;
  final Widget? suffix;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  //content style
  final List<double> contentPadding;

  //icon Style
  final IconData? icon;
  final double? iconSize;
  final Color iconColor;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final Color prefixIconColor;
  final IconData? suffixIcon;
  final Widget? suffixText;
  final VoidCallback? suffixIconClick;
  final double? suffixIconSize;
  final Color suffixIconColor;

  //alignment
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;

  //methods
  final ValueChanged<String>? onChanged;

  //validation
  final int minLine;
  final int maxLine;
  final int? maxLength;
  final int? minLength;
  final String? lengthErrorText;
  final String? emptyErrorText;
  final String? patternErrorText;
  final RegExp? regExp;

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  late bool obscured;
  late IconData obscuredIcon;

  @override
  void initState() {
    super.initState();
    obscured = widget.isObscured;
    obscuredIcon = Icons.remove_red_eye;
  }

  @override
  Widget build(BuildContext context) {
    return Box(
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        bgColor: widget.bgColor,
        child: input()
    );
  }

  Widget input(){
    TextEditingController? controller = widget.controller;

    return TextFormField(
      onChanged: widget.onChanged,
      autofocus: widget.autoFocus,
      enabled: widget.isEnabled,
      focusNode: widget.focusNode,
      controller: controller,
      obscureText: obscured,
      textAlignVertical: widget.textAlignVertical,
      textAlign: widget.textAlign,
      keyboardType: widget.inputType,
      maxLines: widget.isExpands?null:widget.maxLine,
      minLines: widget.isExpands?null:widget.minLine,
      expands: widget.isExpands,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.emptyErrorText??'Please enter some text';
        }
        return null;
      },
      style: TextStyle(
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize,
          height: widget.textHeight,
          fontWeight: widget.fontWeight,
          color: widget.color??Colors.black),
      decoration: InputDecoration(
        isDense: true,
        filled: widget.isFilled,
        isCollapsed: false,
        fillColor: widget.bgColor,
        prefix: widget.prefix,
        suffix: widget.suffix,
        labelText: widget.labelText?.tr(),
        hintText: widget.hintText?.tr(),
        contentPadding: Components.getEdge(widget.contentPadding),
        icon: widget.icon!=null
            ?Icon(widget.icon,size: widget.iconSize??16,color: widget.iconColor,)
            :null,
        prefixIcon: widget.prefixIcon!=null
            ?Icon(widget.prefixIcon,size: widget.prefixIconSize??18,color: widget.prefixIconColor,)
            :null,
        suffixIcon: widget.suffixIcon!=null
            ?IconButton(
              splashRadius: 20,
              icon: Icon(widget.changeObscured?obscuredIcon:widget.suffixIcon,size: widget.suffixIconSize??18,color: widget.suffixIconColor,),
              onPressed: widget.changeObscured
                  ? (){
                    setState(() {
                      obscured ? obscuredIcon = Icons.remove_red_eye_outlined: obscuredIcon = Icons.remove_red_eye;
                      obscured = !obscured;
                    });
                  }
                  : widget.clearField
                  ? (){
                   controller?.clear();
                  }
                  : widget.suffixIconClick) :widget.suffixText,
        labelStyle: TextStyle(
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w600,
            color: widget.labelColor),
        errorStyle: TextStyle(
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize-2,
            fontWeight: FontWeight.w300,
            color: widget.errorColor),
        hintStyle: TextStyle(
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.hintColor),
        errorBorder:  widget.noBorder? InputBorder.none:
        widget.isClassic ?UnderlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius)
        )
            :OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red,
              width: widget.focusedBorderWidth),
          borderRadius: BorderRadius.circular(widget.radius ),
        ),
        focusedErrorBorder:  widget.noBorder? InputBorder.none:
        widget.isClassic ?UnderlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
              color: Colors.red,
              width: widget.focusedBorderWidth),
        )
            :OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red,
              width: widget.focusedBorderWidth),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        focusedBorder:  widget.noBorder? InputBorder.none:
        widget.isClassic ?UnderlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: widget.focusedBorderWidth),
        )
            :OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: widget.focusedBorderWidth),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        enabledBorder:  widget.noBorder? InputBorder.none:
        widget.isClassic ?UnderlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide:BorderSide(
              color: widget.enabledBorderColor,
              width: widget.enabledBorderWidth),
        )
            :OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.enabledBorderColor,
              width: widget.enabledBorderWidth),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        border: widget.noBorder?InputBorder.none:
        widget.isClassic ?UnderlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide:const BorderSide(color: Colors.black, width: 5.0),
        )
            :OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
            const BorderSide(color: Colors.black, width: 5.0)),
      ),
    );
  }
}
