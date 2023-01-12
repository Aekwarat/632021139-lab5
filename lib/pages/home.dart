import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _text3 = TextEditingController();
  String isRadio = "";
  bool isCheck = false;

  List<Fruit> fruits = [];
  final List<ListItem> _dropdownItems = [
    ListItem(1, 'คณะศึกษาศาสตร์'),
    ListItem(2, 'คณะมนุษยศาสตร์และสังคมศาสตร์'),
    ListItem(3, 'คณะศิลปกรรมศาสตร์'),
    ListItem(4, 'คณะเศรษฐศาสตร์และบริหารธุรกิจ'),
    ListItem(5, 'คณะนิติศาสตร์'),
    ListItem(6, 'คณะวิทยาศาสตร์'),
    ListItem(7, 'คณะวิทยาการสุขภาพและการกีฬา'),
    ListItem(8, 'วิทยาลัยการจัดการเพื่อการพัฒนา'),
    ListItem(9, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
    ListItem(10, 'คณะวิศวกรรมศาสตร์'),
    ListItem(11, 'คณะพยาบาลศาสตร์'),
    ListItem(12, 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);
    _dropdownMenuItems = buildDropdownMenuItem(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculation"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //Center(child: Text("\nHeight")),
            TextFormField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(suffixText: "cm", labelText: "height"),
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextFormField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(suffixText: "kg", labelText: "weight"),
              onChanged: (value) {
                setState(() {});
              },
            ),

            Center(child: Text("Sex")),
            RadioListTile(
              title: Text("*Male"),
              value: "Male",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("*Female"),
              value: "Female",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("*Other (LGBT+)"),
              value: "Other",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("*Not Specify"),
              value: "Not",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: Text('******คำนวณค่า BMI******'),
            ),
            Column(
              children: createFruitCheckbox(),
            ),
            DropdownButton(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
                print(_selectedItem!.name);
                print(_selectedItem!.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for (Fruit fruit in fruits) {
      print(fruit.thName);
      myfruit.add(
        CheckboxListTile(
          title: Text(fruit.thName),
          value: fruit.isCheck,
          onChanged: (value) {
            setState(() {
              fruit.isCheck = value!;
            });
          },
        ),
      );
    }

    return myfruit;
  }
}

class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName, this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("1", "banana", false),
      Fruit("2", "Orange", false),
      Fruit("3", "Apple", false),
      Fruit("4", "coconut", false),
    ];
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
