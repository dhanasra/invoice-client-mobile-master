library components;


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

part 'input/text_input.dart';
part 'input/single_select.dart';
part 'label/label.dart';
part 'label/content.dart';
part 'button/primary_button.dart';
part 'layouts/box.dart';
part 'layouts/expanded_row.dart';
part 'resources/app_colors.dart';
part 'resources/app_dimen.dart';
part 'resources/app_font.dart';
part 'resources/app_style.dart';
part 'animations/fade_animation.dart';
part 'animations/scale_animation.dart';
part 'animations/slide_animation.dart';
part 'animations/wave_animation.dart';
part 'animations/rotation_animation.dart';
part 'common/color_shader.dart';
part 'common/loader.dart';
part 'view/carousel_slider.dart';
part 'view/page_indicator.dart';
part 'app_bar/app_bar_types.dart';
part 'invoices/default_invoice.dart';
part 'invoices/table.dart';
part 'invoices/model.dart';
part 'constants.dart';
part 'utils.dart';
part 'global.dart';

class Components{

  static EdgeInsetsGeometry getEdge(List edges){
    switch(edges.length){
      case 0: return const EdgeInsets.all(0);
      case 1: return EdgeInsets.all(edges[0]);
      case 2: return EdgeInsets.only(left: edges[0],right: edges[0],top: edges[1],bottom: edges[1]);
      case 4: return EdgeInsets.only(left: edges[0],right: edges[1],top: edges[2],bottom: edges[3]);
      default: return const EdgeInsets.all(0);
    }
  }

}