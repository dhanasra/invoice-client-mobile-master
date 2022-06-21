part of components;


class SingleSelect extends StatefulWidget {
  const SingleSelect({
    Key? key,
    required this.value,
    required this.options,
    this.width = 300,
    this.isTextInputAdded = false,
    this.textAlign = start,
    this.color = textColor1,
    this.fontSize = 12
  }) : super(key: key);

  final String value;
  final List<String> options;
  final double width;
  final bool isTextInputAdded;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  @override
  _SingleSelectState createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  late String value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: 40,
        child: Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              value: value,
              focusColor: white,
              isExpanded: true,
              buttonPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
              buttonHeight: 50,
              buttonWidth: 160,
              itemHeight: 40,
              dropdownWidth: widget.width,
              items: widget.options.map((e) {
                return DropdownMenuItem<String>(
                    value: e,
                    child: SizedBox(
                      width: 300,
                      child: Content(
                        text: e,
                        textAlign: widget.textAlign,
                        color: widget.color,
                        fontSize: widget.fontSize,
                      ),
                    )
                );}).toList(),
              onChanged: (val){
                setState(() {
                  value = val as String;
                });
              },
              dropdownDecoration: const BoxDecoration(
                color: white,
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: promptColor,
                width: 1,
              ),
              borderRadius: widget.isTextInputAdded
                  ? const BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                  : BorderRadius.circular(4)
          ),
        )
    );
  }
}
