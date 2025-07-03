import 'package:flutter/material.dart';
import 'package:og/widgets/bottom_nav_bar.dart';

class EstimateScreen extends StatefulWidget {
  @override
  _EstimateScreenState createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen> {
  int pages = 1;
  int copies = 1;
  String colorMode = "B/W";
  String pageOption = "All";
  bool isDoubleSided = false;
  int estimatedCost = 0;
  final List<String> pageOptions = [
    "All",
    "Odd pages only",
    "Even pages only",
    "Custom"
  ];
  TextEditingController customPagesController = TextEditingController();

  void reset() {
    setState(() {
      pages = 1;
      copies = 1;
      colorMode = "B/W";
      pageOption = "All";
      isDoubleSided = false;
      estimatedCost = 0;
      customPagesController.clear();
    });
  }

  int getSelectedPageCount() {
    if (pageOption == "All") {
      return pages;
    } else if (pageOption == "Odd pages only") {
      return (pages / 2).ceil();
    } else if (pageOption == "Even pages only") {
      return (pages / 2).floor();
    } else if (pageOption == "Custom") {
      return _parseCustomPages(customPagesController.text, pages);
    }
    return pages;
  }

  int _parseCustomPages(String input, int maxPage) {
    // Accepts input like: 1,3,5-7
    final parts = input.split(',');
    final Set<int> selected = {};
    for (var part in parts) {
      part = part.trim();
      if (part.contains('-')) {
        final range = part.split('-');
        if (range.length == 2) {
          int? start = int.tryParse(range[0]);
          int? end = int.tryParse(range[1]);
          if (start != null && end != null && start <= end) {
            for (int i = start; i <= end && i <= maxPage; i++) {
              selected.add(i);
            }
          }
        }
      } else {
        int? page = int.tryParse(part);
        if (page != null && page >= 1 && page <= maxPage) {
          selected.add(page);
        }
      }
    }
    return selected.length;
  }

  void calculateCost() {
    int costPerPage = colorMode == "Color" ? 5 : 2;
    int selectedPages = getSelectedPageCount();
    int total = selectedPages * copies * costPerPage;
    if (isDoubleSided)
      total = (total * 0.9).toInt(); // 10% discount for double-sided
    setState(() {
      estimatedCost = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Estimate Printing Cost",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              _card(
                child: _buildStepper("Select Number of pages", pages, (val) {
                  setState(() => pages = val);
                }),
              ),
              SizedBox(height: 16),
              _card(
                child: _colorModeToggle(),
              ),
              SizedBox(height: 16),
              _card(
                child: _buildDropdown("Pages", pageOption, pageOptions, (val) {
                  setState(() => pageOption = val);
                }),
              ),
              if (pageOption == "Custom")
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: customPagesController,
                    decoration: InputDecoration(
                      labelText: "e.g. 1,3,5-7",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              SizedBox(height: 16),
              _card(
                child: _buildStepper("Copies", copies, (val) {
                  setState(() => copies = val);
                }),
              ),
              SizedBox(height: 16),
              _card(
                child: _buildSwitch("Double-sided", isDoubleSided, (val) {
                  setState(() => isDoubleSided = val);
                }),
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: reset,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFD1D5DB)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text("Reset",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: calculateCost,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2346E6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                      ),
                      child: Text("Calculate",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
              if (estimatedCost > 0)
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    children: [
                      Text("Estimated Cost",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("₹ $estimatedCost",
                          style: TextStyle(fontSize: 28, color: Colors.green)),
                      Text(
                          "*Final cost may vary based on actual print details.",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE8EDFF)),
      ),
      child: child,
    );
  }

  Widget _buildStepper(String title, int value, Function(int) onChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        Row(
          children: [
            _stepperButton(Icons.remove, () {
              if (value > 1) onChange(value - 1);
            }),
            SizedBox(width: 12),
            Text(value.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(width: 12),
            _stepperButton(Icons.add, () {
              onChange(value + 1);
            }),
          ],
        ),
      ],
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE8EDFF)),
        ),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    );
  }

  Widget _colorModeToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Color Mode",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FB),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              _toggleButton("B/W", colorMode == "B/W", () {
                setState(() => colorMode = "B/W");
              }),
              _toggleButton("Color", colorMode == "Color", () {
                setState(() => colorMode = "Color");
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _toggleButton(String label, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF2346E6) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String title, String value, List<String> options,
      Function(String) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        DropdownButton<String>(
          value: value,
          underline: SizedBox(),
          borderRadius: BorderRadius.circular(12),
          onChanged: (val) => onChanged(val!),
          items: options.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSwitch(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF2346E6),
        ),
      ],
    );
  }
}
