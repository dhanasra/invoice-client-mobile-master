part of components;

class Box extends StatelessWidget {
  final String? url;
  final String? asset;
  final Widget? child;
  final Color? bgColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double radius;
  final bool isShadow;
  final bool bottomBorder;
  final List<double> padding;
  final List<double> margin;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final Alignment? alignment;
  final Border? border;
  final bool expanded;

  const Box({
    Key? key,
    this.url,
    this.asset,
    this.child,
    this.bgColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderWidth,
    this.radius = blunt,
    this.isShadow = false,
    this.padding = const [],
    this.margin = const [],
    this.constraints,
    this.bottomBorder = false,
    this.decoration,
    this.alignment,
    this.border,
    this.expanded = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: expanded?double.infinity:width,
        child: child,
        height: height,
        alignment: alignment,
        padding: Components.getEdge(padding),
        margin: Components.getEdge(margin),
        constraints: constraints,
        decoration: bottomBorder?
              BoxDecoration(
                color: bgColor?? (isShadow
                    ? Colors.white
                    : Colors.transparent),
                border: Border(
                  bottom: BorderSide(
                      color:
                      borderColor != null ? borderColor! : promptColor,
                    width: borderWidth??1
                  ),
                  )
              )
            :decoration?? BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor?? (isShadow
              ? Colors.white
              : Colors.transparent),
          image: (url != null || asset !=null) ? DecorationImage(
            image: url != null
                ? NetworkImage(url!) : AssetImage('assets/images/'+asset!) as ImageProvider,
            fit: BoxFit.cover,
          ):null,
          border: border?? Border.all(
              color:
              borderColor != null ? borderColor! : Colors.transparent),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 10,
              color: isShadow
                  ? const Color(0x19000000)
                  : Colors.transparent,
            ),
          ],
        )
    );
  }
}
