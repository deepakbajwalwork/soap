import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appcolors_theme.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNodeName;
  final String? Function(String?)? validatorName;
  final FocusNode? nextFocus;
  final Text? title;
  final TextEditingController? controller;
  final bool obscureText;

  const  AppTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.focusNodeName,
    this.validatorName,
    this.nextFocus,
    this.title,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            // height: Get.height*0.05,
            // width: Get.width*0.06,
            child: widget.title,),
        SizedBox(height: Get.height*0.01,),
        SizedBox(
          width: _screenSize.width * 0.89,
          height: _screenSize.height*0.065,
          child: TextFormField(
            style: TextStyle(
              color: AppColors.black,
            ),

            controller: widget.controller,
            focusNode: widget.focusNodeName,
            validator: widget.validatorName,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              // enabledBorder: const UnderlineInputBorder(
              //   borderSide: BorderSide(color: AppColors.bluishGrey),
              // ),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textblue),
              // hintStyle: const TextStyle(color: AppColors.bluishGrey, fontSize: 20),
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.grey),
              errorMaxLines: 5,
              // show password
             // prefixIcon: widget.icon,
              suffixIcon: widget.obscureText
                  ? IconButton(
                icon: Icon(
                  _isVisible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.lightblack,
                ),
                onPressed: () {
                  setState(() => _isVisible = !_isVisible);
                },
              )
                  : null,

             fillColor: Color(0xffF4F9FF),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.lightblack,
                  ),
                ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: AppColors.lightblack,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: AppColors.lightblack
                ),
              ),
             // contentPadding: const EdgeInsets.only(left: 5),
              //filled: true,

            ),
            //  unfocus on the tap on screen
            textInputAction: widget.nextFocus != widget.focusNodeName
                ? TextInputAction.next
                : TextInputAction.done,
            onEditingComplete: () {
              if(widget.nextFocus != widget.focusNodeName) {
                FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocus);
              } else {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            cursorColor: Theme.of(context).hoverColor,

            //for Password obsure field
            obscureText: widget.obscureText ? _isVisible : false,
          ),
        ),
      ],
    );
  }
}