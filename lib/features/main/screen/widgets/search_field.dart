import 'package:flutter/material.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Search',
    );
  }
}