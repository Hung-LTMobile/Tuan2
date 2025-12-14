
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai1',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      home: const CreateComponent(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CreateComponent extends StatefulWidget{
  const CreateComponent({super.key});
  @override
  State<StatefulWidget> createState() => _CreateComponent();
}

class _CreateComponent extends State<CreateComponent> {
  final  _textInput = TextEditingController();
  List<Widget> component =[];
  String? errorText;
  //Tạo component với số nhập vào tương ứng
  void _handleCreateComponent(){

    final textInput = _textInput.text.trim();
    final count = int.tryParse(textInput) ;

    if(count == null){
      setState(() {
        errorText = 'Dữ liệu bạn nhập không hợp lệ';
      });
      return;
    }
    if(count <= 0){
      setState(() {
        errorText='Vui lòng nhập số lớn hơn 0';
      });
      return;
    }else{
      setState(() {
        errorText = null;
        component = List.generate(
          count,
              (index) => Container(
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.from(alpha: 1, red: 255, green: 0, blue:0),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Thực hành 02',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textInput,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Nhập vào số lượng',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.grey,width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.blue,width: 1.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _handleCreateComponent,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Tạo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    if (errorText != null) ...[
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          errorText!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Column(
                children: component,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
