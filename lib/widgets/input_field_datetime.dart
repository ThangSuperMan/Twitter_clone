import 'package:flutter/material.dart';

class InputFieldDateTime extends StatefulWidget {
  final String label;
  final Function(String day, String moth, String year) onChanged;

  const InputFieldDateTime(
      {super.key, required this.label, required this.onChanged});

  @override
  _InputFieldDateTimeState createState() => _InputFieldDateTimeState();
}

class _InputFieldDateTimeState extends State<InputFieldDateTime> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            // Day Dropdown
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                items: List.generate(
                  31,
                  (index) => DropdownMenuItem<String>(
                    value: (index + 1).toString(),
                    child: Text((index + 1).toString()),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                    widget.onChanged(selectedDay ?? '', selectedMonth ?? '',
                        selectedYear ?? '');
                  });
                },
                hint: const Text('Ngày'),
              ),
            ),
            const SizedBox(width: 10),
            // Month Dropdown
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                items: List.generate(
                  12,
                  (index) => DropdownMenuItem<String>(
                    value: (index + 1).toString(),
                    child: Text((index + 1).toString()),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                    widget.onChanged(selectedDay ?? '', selectedMonth ?? '',
                        selectedYear ?? '');
                  });
                },
                hint: const Text('Tháng'),
              ),
            ),
            const SizedBox(width: 10),
            // Year Dropdown
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                items: List.generate(
                  100,
                  (index) => DropdownMenuItem<String>(
                    value: (DateTime.now().year - index).toString(),
                    child: Text((DateTime.now().year - index).toString()),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                    widget.onChanged(selectedDay ?? '', selectedMonth ?? '',
                        selectedYear ?? '');
                  });
                },
                hint: const Text('Năm'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
