import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/screens/home/model/toggle_model.dart';
import 'package:grocery_shopping/utils/color_res.dart';

class CustomToggle extends StatefulWidget {
  final List<ToggleModel> options;
  final ValueChanged<String> onSelected;
  final String initialSelection;

  const CustomToggle({
    super.key,
    required this.options,
    required this.onSelected,
    this.initialSelection = '',
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialSelection.isNotEmpty
        ? widget.initialSelection
        : widget.options.first.name; // ✅ Pick name from model
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(widget.options.length, (index) {
          final option = widget.options[index];
          bool isSelected = option.name == selectedOption;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = option.name;
                });
                widget.onSelected(option.name);
              },
              child: _buildToggleOption(option, isSelected),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildToggleOption(ToggleModel option, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? ColorRes.lightGrey : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            option.image,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 8.w),
          Text(
            option.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
