import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://clinicsales.safehandapps.com/api/v1/medReport';
  static const String _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3MjBmNTg4ODcxZDllMGI0N2I0MjYwNSIsInJvbGUiOiJhZG1pbiJ9LCJpYXQiOjE3MzI3MTk5Mzh9.ywk3dC2Y6gpqqHvyKrtLjcOqCGH52nk3yV_EFFB_vtk'; // استبدل بـ Token الخاص بك

  /// رفع الروشتة
  static Future<String?> uploadRosheta({
    required String title,
    required String terms,
    required File imageFile,
    required BuildContext context,
  }) async {
    const String endpoint = '/upload-roshtaaa';
    final uri = Uri.parse(_baseUrl + endpoint);

    try {
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $_token', // استبدال بـ Token الصحيح
        })
        ..fields['id'] = '67460aa1a477e8aac422e3db'
        ..fields['title'] = title
        ..fields['terms'] = terms;

      // إضافة ملف الصورة
      request.files.add(await http.MultipartFile.fromPath(
        'image', // اسم الحقل الخاص بالصورة (تأكد من صحته)
        imageFile.path,
      ));

      // إرسال الطلب
      final response = await request.send();

      if (response.statusCode == 201) {
        final responseData = jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
        return responseData['report']['_id']; // إرجاع الـ ID الخاص بالروشتة
      } else {
        final errorResponse = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload Rosheta: $errorResponse')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
    return null;
  }
  /// تعديل الروشتة
  static Future<bool> editRosheta({
    required String id,
    required String newTerms,
    required BuildContext context,
    required String title,
    String? special,
    String? test,
    required File imageFile, // الصورة كـ File
  }) async {
    final String endpoint = '/edit-roshta/$id';
    final uri = Uri.parse(_baseUrl + endpoint);

    try {
      // إعداد الطلب كـ Multipart
      var request = http.MultipartRequest('PUT', uri);

      // إضافة الهيدر
      request.headers.addAll({
        'Authorization': 'Bearer $_token',
        'Content-Type': 'multipart/form-data',
      });

      // إضافة البيانات النصية
      request.fields['terms'] = newTerms;
      request.fields['title'] = title;
      request.fields['special'] = special ?? '';
      request.fields['test'] = test ?? '';

      // إضافة الصورة
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      // إرسال الطلب
      var response = await request.send();

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rosheta edited successfully.')),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to edit Rosheta. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
    return false;
  }


  /// حذف الروشتة
  static Future<bool> deleteRoshetaWithBody({
    required String id,
    required BuildContext context,
    required String terms,
    required String special,
  }) async {
    final String endpoint = '/delete-roshta/$id';
    final uri = Uri.parse(_baseUrl + endpoint);

    try {
      final response = await http.delete(
        uri,
        headers: {
          'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'terms': terms,
          'special': special,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rosheta deleted successfully.')),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete Rosheta.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
    return false;
  }}

