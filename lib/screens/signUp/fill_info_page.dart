import 'package:flutter/material.dart';
import 'components/pages/fill_info/fill_info_mobile.dart';

class FillInfoPage extends StatelessWidget {
  const FillInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // if (constraints.maxWidth < 600) {
          //   return const FillInfoMobile();
          // } else if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
          //   return const FillInfoTablet();
          // } else {
          //   return const FillInfoDesktop();
          // }
          return const FillInfoMobile();
        },
      ),
    );
  }
}
