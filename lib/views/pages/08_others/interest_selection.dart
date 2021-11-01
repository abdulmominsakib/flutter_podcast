import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_defaults.dart';
import '../../../consts/app_sizes.dart';
import '../../../consts/dummy_data.dart';
import '../03_entrypoint/entrypoint.dart';
import '../../themes/text.dart';
import 'package:get/get.dart';

class InterestSelectScreen extends StatefulWidget {
  const InterestSelectScreen({Key? key}) : super(key: key);

  @override
  _InterestSelectScreenState createState() => _InterestSelectScreenState();
}

class _InterestSelectScreenState extends State<InterestSelectScreen> {
  RxList<String> _selectedInterest = RxList<String>();

  // This will add the item to list
  _addItemToInterest(String interestItem) {
    if (_selectedInterest.contains(interestItem)) {
      _selectedInterest.remove(interestItem);
    } else {
      _selectedInterest.add(interestItem);
    }
  }

  @override
  void dispose() {
    _selectedInterest.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            AppSizes.DEFAULT_PADDING,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'What’s interesting to you?',
                  style: AppText.h6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text('Select Item by Pressing', style: AppText.caption),
              Expanded(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: List.generate(
                    DummyData.interestName.length,
                    (index) {
                      String _currentIndex = DummyData.interestName[index];
                      return Obx(
                        () => _CustomChip(
                          onTap: () {
                            _addItemToInterest(_currentIndex);
                          },
                          active: _selectedInterest.contains(_currentIndex),
                          label: _currentIndex,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _GoForwardButton(
                  onTap: () {
                    Get.to(() => AppEntryPoint());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoForwardButton extends StatelessWidget {
  const _GoForwardButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppDefaults.defaulBorderRadius,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CustomChip extends StatelessWidget {
  const _CustomChip({
    Key? key,
    required this.active,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final bool active;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppDefaults.defaulBorderRadius,
      child: AnimatedContainer(
        duration: AppDefaults.defaultDuration,
        decoration: BoxDecoration(
          color: active
              ? AppColors.PRIMARY_COLOR
              : Get.theme.scaffoldBackgroundColor,
          borderRadius: AppDefaults.defaulBorderRadius,
          border: Border.all(
            color: active ? AppColors.PRIMARY_COLOR : Colors.black,
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        child: Text(
          label,
          style: AppText.b1.copyWith(
            color: active ? Colors.white : AppColors.DARK_COLOR,
          ),
        ),
      ),
    );
  }
}
