import 'package:flutter/material.dart';

class FilterChipGroupWidget extends StatefulWidget {
  final String title;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelected;

  const FilterChipGroupWidget({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.onSelected,
  });

  @override
  State<FilterChipGroupWidget> createState() => _FilterChipGroupWidgetState();
}

class _FilterChipGroupWidgetState extends State<FilterChipGroupWidget> {
  late String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 15,
            alignment: WrapAlignment.start,
            children: widget.options.map((option) {
              final isSelected = _selectedOption == option;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOption = option;
                  });
                  widget.onSelected(option);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xff0079FE).withAlpha(20): Colors.white ,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF0079FE)
                          : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? const Color(0xFF0079FE)
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
