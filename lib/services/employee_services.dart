import 'dart:convert';

import 'package:api_demo/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeServices {
  String baseUrl = "https://reqres.in/api/";

  getAllEmployeeData() async {
    //Пустой список для новых сотрудников, после того как будут созданы буду находитьс внутри списка
    List<Employee> getAllEmployees = [];
    try {
      //response хранит данные которые отправил сервер
      var response = await http.get(
        Uri.parse(
          "${baseUrl}users?page=2"
        ),
      );
      //Если статус код данных равен 200 то данные успешны пришли, но пришли они в формате Json и нам нужно их расшифровать
      if (response.statusCode == 200) {

        //данные равны коду ответа data
        var data = response.body;

        //Переменная для рассшифровки полученных данных
        var decodedData = jsonDecode(data);

        //Извлекаем данные сотрудника из data:[id: 7, id: 8]
        var employees = decodedData['data'];

        // print(employees); 


        //Пройдемся по каждому элементу списка и преобразуем каждый элемент в обьект класса сотрудников
        for(var employee in employees){
          //Новый обьект класса employee
          Employee newEmployee = Employee.fromJson(employee);
          //Добавляем в список
          getAllEmployees.add(newEmployee);
        } 
        print(getAllEmployees);
        return getAllEmployees;
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}


