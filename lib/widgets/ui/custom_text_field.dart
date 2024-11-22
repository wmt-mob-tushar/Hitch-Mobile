import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitech_mobile/resources/res_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool enabled;
  final VoidCallback? onTap;
  final List<String>? dropdownItems;
  final void Function(String?)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.enabled = true,
    this.onTap,
    this.dropdownItems,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ResColors.textSecondary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 44.w, top: 8.h, bottom: 4.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: ResColors.textSecondary.withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              if (dropdownItems != null)
                DropdownButtonFormField<String>(
                  value: initialValue,
                  onChanged: onChanged,
                  items: dropdownItems!.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(44.w, 4.h, 16.w, 16.h),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ResColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                )
              else
                TextFormField(
                  controller: controller,
                  initialValue: initialValue,
                  obscureText: obscureText,
                  validator: validator,
                  keyboardType: keyboardType,
                  enabled: enabled,
                  onTap: onTap,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ResColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(44.w, 4.h, 16.w, 16.h),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    suffixIcon: suffixIcon,
                  ),
                ),
              if (prefixIcon != null)
                Positioned(
                  left: 16.w,
                  top: 8.h,
                  child: Icon(
                    prefixIcon,
                    size: 18.w,
                    color: ResColors.textSecondary.withOpacity(0.45),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
