import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TagsRadio extends StatefulWidget {
  final List<String> tags;
  final ValueChanged<String> selected;
  final double radius;

  const TagsRadio({
    Key? key,
    required this.tags,
    required this.selected,
    this.radius = blunt
  }) : super(key: key);

  @override
  _TagsRadioState createState() => _TagsRadioState();
}

class _TagsRadioState extends State<TagsRadio> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.tags.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.selected(widget.tags[index]);
                },
                child: Box(
                    margin: const [0,10,0,0],
                    radius: widget.radius,
                    padding: const [15,0],
                    borderColor: selectedIndex==index?btnColor:promptColor,
                    bgColor: selectedIndex==index?btnColor.withOpacity(0.2):borderColor,
                    child: Label(
                      fontSize: 12,
                      label:widget.tags[index],
                      color: selectedIndex==index?btnColor:textColor,
                    )
                ),
            );
          },
        )
    );
  }
}

