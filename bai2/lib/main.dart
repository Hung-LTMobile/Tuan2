import 'package:flutter/material.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Bai2',
      theme: ThemeData(
        colorScheme: const ColorScheme.light()
      ),
      home:const Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class Calculator extends StatefulWidget{
  const Calculator({super.key});
  @override
  State<StatefulWidget> createState() => _CreateCalculator();

}

class _CreateCalculator extends State<Calculator>{
  final _number1 = TextEditingController();
  final _number2 = TextEditingController();
  bool isClicked = false;
  double ? result;
  void _handleOperator(String operator){
    final double? num1 = double.tryParse(_number1.text);
    final double? num2= double.tryParse(_number2.text);
    if(num1==null || num2==null){
      setState(() {
        result = null;
      });
      return;
    }
    setState(() {
      isClicked =true;
      switch(operator){
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num2 != 0 ? num1 / num2 : null;
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar() ,
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height:50),
            Text("Thực hành 03",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height:50),
            TextField(
              controller: _number1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height:40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () =>_handleOperator('+'),style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(60,60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  )
                ), child: Text('+',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),),

                ElevatedButton(onPressed: () =>_handleOperator('-'),style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: Size(60,60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    )
                ), child: Text('-',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),),

                ElevatedButton(onPressed: () =>_handleOperator('*'),style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: Size(60,60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    )
                ), child: Text('*',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),),

                ElevatedButton(onPressed: () =>_handleOperator('/'),style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(60,60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    )
                ), child: Text('/',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),),

              ],
            ),
            SizedBox(height:40),
            TextField(
              controller: _number2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height:10),
            Row(
              children: [
                Text('Kết quả: ',style: TextStyle(fontSize: 18)),
                if(isClicked)
                  Text(
                    result == null ? 'Lỗi nhập dữ liệu' : '$result',
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

