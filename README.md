# FHIR_Validator

Offline FHIR Validator for India Context

The FHIR_Validator is an offline tool configured to use the India implementation guide (ndhm.in) with version 6.0.0. It leverages the standard FHIR validator to ensure that your FHIR profiles adhere to the specified guidelines.

## Prerequisites

Before running the validator, ensure that you have the Java Runtime Environment installed on your system.

To check if Java is installed, open your command prompt and type:

java --version

## Steps to Run the Validation Script

### Clone the Repository:

```
git clone https://github.com/vishi24/FHIR_Validator.git
cd FHIR_Validator
```

Download FHIR validator jar from https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar

Place the downloaded jar in the cloned repository.

### Place All the Profiles to Be Validated in the FHIR_bundles Directory:

Move or copy all the FHIR profiles you want to validate into the FHIR_bundles directory within the cloned repository.

Open Command Shell and Execute the validator.sh Script:

**For Windows Machines:**

PowerShell is required to execute the script.
In the cloned folder, type powershell in the address bar and hit enter to open PowerShell in that directory.
Execute the script by typing:

```
sh .\Validator.sh 
```

**For Other Systems:**

Open your terminal and navigate to the cloned directory.
Execute the script by typing:

```
sh ./Validator.sh
```

**Quick Tip**

For Windows machines, using PowerShell is necessary to run the script. To open PowerShell in the cloned directory, type powershell in the explorer address bar of the cloned repository and hit enter.

Feel free to contribute to this project by opening issues or submitting pull requests.
