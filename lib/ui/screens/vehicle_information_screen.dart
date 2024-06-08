import 'package:car_rental/controllers/car_controller.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/services/car_service.dart';
import 'package:car_rental/ui/screens/additional_charges_screen.dart';
import 'package:car_rental/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleInformationScreen extends StatefulWidget {
  @override
  _VehicleInformationScreenState createState() =>
      _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  final CarController carController = Get.put(CarController());
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleModelController = TextEditingController();
  late List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  void fetchCars() async {
    try {
      List<Car> fetchedCars = await CarService().fetchCars();
      setState(() {
        cars = fetchedCars;
      });
    } catch (e) {
      print('Error fetching cars: $e');
    }
  }

  List<Car> getFilteredCars(String selectedType, String searchText) {
    return cars
        .where((car) =>
            car.type.toLowerCase() == selectedType.toLowerCase() &&
            car.model.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  Set<String> getUniqueTypes() {
    return cars.map((car) => car.type).toSet();
  }

  @override
  Widget build(BuildContext context) {
    Set<String> uniqueTypes = getUniqueTypes();
    List<Car> filteredCars = getFilteredCars(
        vehicleTypeController.text, vehicleModelController.text);

    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 15),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.fromLTRB(23, 48.5, 22, 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionHeader(title: 'Vehicle Information'),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: vehicleTypeController.text.isNotEmpty
                    ? vehicleTypeController.text
                    : null,
                items: uniqueTypes
                    .map((type) => DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    vehicleTypeController.text = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFDFDFFF))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
                  ),
                  labelText: 'Vehicle Type',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: vehicleModelController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFDFDFFF))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
                  ),
                  labelText: 'Vehicle Model',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 50),
              ...filteredCars
                  .map(
                    (car) => Container(
                      padding: EdgeInsets.all(19),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD7D7FF)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(
                                car.imageURL,
                                width: 163,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${car.make} ${car.model}',
                                      style: GoogleFonts.mulish(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text('Seats: ${car.seats}',
                                      style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: Color(0xFF6F6F6F))),
                                  SizedBox(height: 10),
                                  Text('Bags: ${car.bags}',
                                      style: GoogleFonts.mulish(
                                          fontSize: 14,
                                          color: Color(0xFF6F6F6F))),
                                ],
                              )
                            ],
                          ),
                          Divider(color: Color(0xFF5D5CFF), thickness: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${car.hourlyRate} / Hour',
                                  style: GoogleFonts.mulish(
                                      fontSize: 14, color: Color(0xFF6F6F6F))),
                              SizedBox(width: 20),
                              Text('\$${car.dailyRate} / Day',
                                  style: GoogleFonts.mulish(
                                      fontSize: 14, color: Color(0xFF6F6F6F))),
                              SizedBox(width: 20),
                              Text('\$${car.weeklyRate} / Week',
                                  style: GoogleFonts.mulish(
                                      fontSize: 14, color: Color(0xFF6F6F6F))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                carController.selectCar(car);
                                Get.to(AdditionalChargesScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5D5CFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Container(
                                width: 175,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.5),
                                child: Text(
                                  'Next',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    letterSpacing: 0.3,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
