#After downloading this file, open a terminal window at the containing folder, then enter the command 'python3 Daysbtw2DatesProd.py' to run Days Between 2 Dates.

print("This script prompts you to enter 2 dates and automatically calculates the number of days between them (inclusive of the end date).")
print("You may repeat calculations ad infinitum so long as you enter 'y', 'Y', 'yes', 'Yes', or 'YES' when asked 'Do you wish to repeat this operation for a new date range? (Y/N)'")
print("When 'n', 'N', 'no', 'No', or 'NO' is entered instead, the script asks if you wish to have your previous calculations for the current session totaled.")
print("If 'yes' (or one of the aforementioned semantic equivalents) is entered, the total of all calculations obtained in the current session is given, after which the option to start a new session of calculations or exit the program displays; any other input here force-quits this shell window instantly.")
print("Sample Use Cases:")
print("(i) Track and relay to a student how many days the FT CPT (Full-Time Curricular Practical Training) request which you've just authorized entails in your office's tailored CPT approval email.")
print("(ii) Determine if a student has exceeded or will exceed, respectively, the maximum number of total FT CPT days permitted without losing OPT eligibility at current degree level while processing their OPT or CPT request.")

import datetime

total_sum = 0
print("--------CALCULATE # OF DAYS BTW ANY DATE RANGE---------")
start_date = input("Please enter a start date in the format m/d/yyyy: ") 
#convert start date to datetime object 
start_date = datetime.datetime.strptime(start_date, "%m/%d/%Y") 
end_date = input("Please enter an end date in the format m/d/yyyy: ") 
#convert end date to datetime object 
end_date = datetime.datetime.strptime(end_date, "%m/%d/%Y")  
difference = (end_date - start_date).days + 1
print("The number of days between your two dates is", difference)
total_sum += difference
repeat = input("Do you wish to repeat this operation for a new date range? (Y/N): ").lower()
while repeat == 'y' or repeat == 'Y' or repeat == 'YES' or repeat == 'yes' or repeat == 'Yes':
    start_date = input("Please enter a start date in the format m/d/yyyy: ") 
    start_date = datetime.datetime.strptime(start_date, "%m/%d/%Y") 
    end_date = input("Please enter an end date in the format m/d/yyyy: ") 
    end_date = datetime.datetime.strptime(end_date, "%m/%d/%Y")  
    difference = (end_date - start_date).days + 1  
    print("The number of days between the provided dates is:", difference)
    total_sum += difference
    repeat = input("Do you wish to repeat this operation for a new date range? (Y/N): ").lower()
if repeat == 'n' or repeat == 'no' or repeat == 'N' or repeat == 'NO' or repeat == 'No':
    total = input("Do you wish to total the previous calculations? (Y/N): ").lower()
    if total == 'y' or total == 'yes' or total == 'Y' or total == 'Yes' or total == 'YES':
        print("The sum of all previous calculations is:", total_sum)
        answer = input("Do you wish to start a new session of this program for another student/case (Y) or exit now (N)?: ").lower()
        if answer == 'y' or answer == 'yes' or answer == 'Y' or answer == 'Yes' or answer == 'YES':
            start_date = input("Please enter a start date in the format M/D/YYYY: ")
            start_date = datetime.datetime.strptime(start_date, "%m/%d/%Y") 
            end_date = input("Please enter an end date in the format M/D/YYYY: ")
            end_date = datetime.datetime.strptime(end_date, "%m/%d/%Y")  
            difference = (end_date - start_date).days + 1  
            print("The number of days between the provided dates is:", difference)
            total_sum += difference
            repeat = input("Do you wish to repeat this operation for a new date range? (Y/N): ").lower()
        else:
            exit()
    else:
        exit()
else: 
    exit()