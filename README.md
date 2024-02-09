# EC2 Instance Startup Script

This Bash script is designed to automate the process of checking if an Amazon EC2 instance is running and starting it up if it's not. It utilizes the AWS CLI (Command Line Interface) to interact with AWS services.

## **Prerequisites**

Before you begin, ensure you have the following:

AWS CLI installed and configured on your machine.
Review the IAM permissions associated with the AWS CLI credentials to ensure they have sufficient privileges to manage EC2 instances.

## **How it works**

### **Functions:**

1. **check_ec2():**
  - This function checks the status of a specific EC2 instance using its instance ID.
  - It queries AWS to retrieve the state of the instance and compares it to the expected state "running".
  - Returns 0 if the instance is running, otherwise returns 1.

2. **start_ec2_if_not_running():**
  - Calls the check_ec2() function to see if the instance is running.
  - If the instance is not running, it starts the instance using its ID.
  - If the instance is already running, it displays a message indicating that.

### **Main Script:**

1. **start_ec2_if_not_running:**
  - Invokes the start_ec2_if_not_running() function.
  - This is the entry point of the script.

2. **Wait Loop:**
  - The script enters a loop to continuously check the status of the EC2 instance until it is running.
  - Inside the loop, it calls the check_ec2() function.
  - If the instance is running, it displays a message and exits the loop.
  - If the instance is not running, it displays a message and waits for a predefined time (10 seconds by default) before checking again.

## **Usage**

1. **Configuration:**
  - Replace the "INSTANCE_ID" with the ID of your EC2 instance.
    
2. **Adjustments (Optional):**
  - You can adjust the sleep time in the script to wait for a different duration between checks (e.g., increase/decrease the sleep time as needed).

3. **Execution:**
  - Make the script executable (chmod +x script_name.sh).
  - Run the script (./script_name.sh).
