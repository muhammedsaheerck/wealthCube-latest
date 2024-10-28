import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/extentions.dart';
import '../../utils/app_constants.dart';

class CommonTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  final TextAlign align;
  final double letterSpacing;
  final FontWeight fontWeight;
  final int? maxLines;
  final double? height;
  final double? wordSpacing;
  final TextOverflow? overFlow;
  final List<Shadow>? shadows;

  const CommonTextWidget({
    super.key,
    this.color,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.5,
    this.maxLines,
    this.align = TextAlign.center,
    this.overFlow,
    this.height,
    this.wordSpacing,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        maxLines: maxLines,
        text,
        textAlign: align,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            shadows: shadows,
            color: color,
            fontSize: fontSize,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            overflow: overFlow,
            wordSpacing: wordSpacing,
          ),
        ));
  }
}

class CommonButton extends StatelessWidget {
  final void Function()? ontap;

  final double horizontal;
  final Color bgColor;
  final double? width;
  final double? fontSize;
  final Color textColor;
  final String text;
  final FontWeight fontWeight;
  final Color borderColor;
  final double height;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;

  const CommonButton(
      {super.key,
      this.textColor = AppConstants.appLettersAndIconsColor,
      this.borderColor = Colors.transparent,
      required this.ontap,
      this.horizontal = 0.0,
      this.bgColor = AppConstants.appPrimaryColor,
      this.fontWeight = FontWeight.normal,
      this.fontSize,
      this.width,
      required this.height,
      required this.text,
      this.borderRadius,
      this.gradient,
      this.child});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? Responsive.wp(100),
        height: height,
        // padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 15),
        decoration: BoxDecoration(
          gradient: gradient,
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: borderRadius ?? BorderRadius.circular(5),
        ),
        child: Center(
          child: child ??
              CommonTextWidget(
                color: textColor,
                text: text,
                fontWeight: fontWeight,
                fontSize: fontSize ?? 12,
              ),
        ),
      ),
    );
  }
}

class CommonInkwell extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? borderRadius;
  final Color? splashColor;
  const CommonInkwell(
      {super.key,
      required this.child,
      required this.onTap,
      this.borderRadius,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      splashColor: splashColor ?? Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final bool isobsecureTrue;
  final bool isSuffixShow;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  const CustomTextFormFieldWidget(
      {super.key,
      required this.controller,
      this.maxLines = 1,
      this.keyboardType,
      required this.hintText,
      this.prefix,
      this.suffix,
      this.validator,
      this.textInputAction,
      this.isobsecureTrue = false,
      this.readOnly = false,
      this.isSuffixShow = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      textInputAction: textInputAction,
      obscureText: isobsecureTrue,
      keyboardType: keyboardType,
      validator: validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hintText,
        suffixIcon: suffix,
      ),
    );
  }
}

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  const CachedImageWidget(
      {super.key,
      required this.imageUrl,
      this.height = 0,
      this.width = 0,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: SizedBox(
          height: height > Responsive.wp(50) ? 35 : height,
          width: width > Responsive.hp(50) ? 35 : width,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppConstants.appPrimaryColor,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.asset("", fit: BoxFit.cover);
      },
    );
  }
}

void toast({
  String? title,
  int duration = 2,
  Color? backgroundColor,
}) {
  Fluttertoast.showToast(
      msg: title ?? 'Something went wrong',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

class CommonTextFormField extends StatelessWidget {
  final Color? bgColor;
  final String hintText;
  final Color? hintTextColor;
  final bool readOnly;

  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const CommonTextFormField(
      {super.key,
      this.bgColor,
      required this.hintText,
      this.hintTextColor,
      this.readOnly = false,
      required this.keyboardType,
      this.textInputAction,
      this.validator,
      this.maxLength,
      required this.controller,
      this.contentPadding,
      this.obscureText = false,
      this.suffixIcon,
      this.maxLines = 1,
      this.prefixIcon,
      this.onChanged,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(
        color: AppConstants.lowDarkGreen2,
        fontSize: 16,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      maxLines: maxLines,
      onChanged: onChanged,
      cursorColor: AppConstants.lowDarkGreen2,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        counterText: '',
        alignLabelWithHint: true,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        fillColor: bgColor ?? AppConstants.appLightGreenColor,
        filled: true,
        labelText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppConstants.appLettersAndIconsColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      validator: validator,
      maxLength: maxLength,
      controller: controller,
    );
  }
}

class ButtonLoadingWidget extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  const ButtonLoadingWidget({
    super.key,
    this.height,
    this.color,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: ShapeDecoration(
        color: color ?? AppConstants.appPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      ),
      width: width ?? Responsive.wp(100),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppConstants.black),
        ),
      ),
    );
  }
}
