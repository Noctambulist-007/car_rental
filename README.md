# Car Rental Application

## Overview
This Flutter application enables users to rent cars and view detailed reservation information. It utilizes GetX for state management.

![Screenrecorder-2024-06-09-00-35-47-230 (1)](https://github.com/Noctambulist-007/car_rental/assets/137734510/3e00486e-00ea-4b55-b87f-b5aae68ecd54)

## How to Run Locally
To run this application locally, follow these steps:

1. Clone the repository:
2. Navigate to the project directory:
3. Ensure you have Flutter installed on your machine. If not, follow the installation instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
4. Run the application:
   
## Handling Rental Rates
### Hourly, Daily, and Weekly Rates
In the scenario where a Tesla is rented for six hours at $10 per hour and $50 per day, the customer would indeed end up paying more than the daily rate for one-fourth of the period.

To handle such cases, the application calculates rental charges based on the hourly, daily, and weekly rates. Here's how it works:

1. **Hourly Rate**: The application calculates the rental charge for the specified duration at the hourly rate.

2. **Daily Rate**: If the duration exceeds one day but is less than one week, the application calculates the rental charge at the daily rate. It considers any remaining hours beyond the daily rental period as additional hours, charged at the hourly rate.

3. **Weekly Rate**: If the duration exceeds one week, the application calculates the rental charge at the weekly rate. It considers any remaining days beyond the weekly rental period as additional days, charged at the daily rate.

By using this approach, the application ensures fair and accurate rental pricing based on the chosen duration and rate structure.

Feel free to reach out if you have any questions or need further assistance!
