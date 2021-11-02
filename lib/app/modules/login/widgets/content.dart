import 'package:app_airbnb/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'form_login.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: _CustomClipper(),
        child: Container(
          color: AppTheme.background,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: FormLogin(),
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..lineTo(0, size.height * .3)
    ..arcToPoint(
      Offset(size.width * .03, size.height * .25),
      radius: Radius.circular(40.0),
    )
    ..lineTo(size.width * .4, size.height * .03)
    ..quadraticBezierTo(size.width * .45, 0, size.width * .5, 0)
    ..quadraticBezierTo(size.width * .55, 0, size.width * .6, size.height * .03)
    ..lineTo(size.width * .97, size.height * .25)
    ..arcToPoint(
      Offset(size.width, size.height * .3),
      radius: Radius.circular(40.0),
    )
    ..lineTo(size.width, size.height)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
